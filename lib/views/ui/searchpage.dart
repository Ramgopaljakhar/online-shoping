import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.names, required this.tabIndex});
  final Future<List<SneakersModel>> names;
  final int tabIndex;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: customField(
          hintText: 'Search for a product',
          controller: search,
          onEditingComplete: () {
            setState(() {});
          },
          prefixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.camera_alt, color: Colors.black),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(Icons.search, color: Colors.black),
          ),
        ),
      ),
      body: search.text.isEmpty
          ? Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 5),
              child: Image.asset(
                'assets/images/pose23.png',
                fit: BoxFit.cover,
              ),
            )
          : FutureBuilder<List<SneakersModel>>(
              future: widget
                  .names, // Accessing widget.name instead of name directly
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error Retrieving the data'),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Product not found'),
                  );
                } else {
                  final shoes = snapshot.data!;
                  final filteredShoes = shoes
                      .where((shoe) => shoe.name
                          .toLowerCase()
                          .contains(search.text.toLowerCase()))
                      .toList();
                  return ListView.builder(
                    itemCount: filteredShoes.length,
                    itemBuilder: (context, index) {
                      final shoe = filteredShoes[index];
                      return GestureDetector(
                        onTap: () {
                          productProvider.shoesSizes = shoe.sizes;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(
                                id: shoe.name,
                                category: shoe.category,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: Container(
                              height: 90,
                              width: 325,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500]!,
                                    blurRadius: 0.3,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.network(
                                      shoe.imageUrl[0],
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 11, left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shoe.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          shoe.category,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          shoe.price,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}
