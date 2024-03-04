import 'package:flutter/material.dart';
import 'package:online_shop/services/helper.dart';
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.male, required this.tabIndex});
  final Future<List<SneakersModel>> male;
  final int tabIndex;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
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
              future: Helper().getSearchSneakers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: reusableText(
                      title: 'Error Retrieving the data',
                      style: appstyle(16, Colors.black, FontWeight.w700),
                    ),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: reusableText(
                      title: 'Product not found',
                      style: appstyle(16, Colors.black, FontWeight.w700),
                    ),
                  );
                } else {
                  final shoe = snapshot.data!;
                  return ListView.builder(
                    itemCount: shoe.length,
                    itemBuilder: (context, index) {
                      final currentShoe = shoe[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(
                                id: currentShoe.id,
                                category: currentShoe.category,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(currentShoe.name),
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
