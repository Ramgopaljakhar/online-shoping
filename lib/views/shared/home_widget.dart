import 'package:online_shop/views/shared/export_package.dart';
import 'package:online_shop/views/shared/export.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.male,
    required this.tabIndex,
  });

  final Future<List<SneakersModel>> male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.406,
          child: FutureBuilder<List<SneakersModel>>(
            future: male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error $snapshot.error');
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        productProvider.shoesSizes = shoe.sizes;
                        if (kDebugMode) {
                          print(productProvider.shoeSizes);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(
                                  id: shoe.id, category: shoe.category),
                            ));
                      },
                      child: ProductCard(
                        category: shoe.category,
                        id: shoe.id,
                        image: shoe.imageUrl[0],
                        name: shoe.name,
                        price: "\$${shoe.price}",
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reusableText(
                      title: 'Latest Shoes',
                      style: appstyle(19, black, FontWeight.bold)),

                  //show All
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductByCart(tabIndex: tabIndex),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        reusableText(
                            title: 'Show All',
                            style: appstyle(16, black, FontWeight.w400)),
                        const Icon(
                          Icons.arrow_right,
                          size: 29,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: FutureBuilder<List<SneakersModel>>(
              future: male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error$snapshot.error");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductByCart(tabIndex: tabIndex),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NewShoes(
                            imageUrl: shoe.imageUrl[1],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
