import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.id,
    required this.category,
  });

  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getShoes(widget.category, widget.id);
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();
    var favoritesProvider =
        Provider.of<FavoritesProvider>(context, listen: true);
    favoritesProvider.getFavorites();
    return Scaffold(
      body: FutureBuilder<SneakersModel>(
        future: productProvider.sneaker,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return Text("Error ${snapshot.error}");
          } else {
            final sneaker = snapshot.data!;
            // ignore: unused_local_variable
            // final productProvider = Provider.of<ProductProvider>(context);

            return Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leadingWidth: 0,
                      automaticallyImplyLeading: false,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // productProvider.shoeSizes.clear();
                              },
                              child: const Icon(Icons.close, color: black),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle heart icon tap
                              },
                              child: const Icon(
                                Icons.more_horiz,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: 402.h,
                              child: PageView.builder(
                                controller: pageController,
                                itemCount: sneaker.imageUrl.length,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (page) {
                                  productProvider.activePage = page;
                                },
                                itemBuilder: (context, int index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: gray300,
                                        child: Image.network(
                                          sneaker.imageUrl[index],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                          right: 17,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          child: Consumer<FavoritesProvider>(
                                            builder: (context,
                                                favoritesProvider, child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  if (favoritesProvider.ids
                                                      .contains(widget.id)) {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FavoritesPage(),
                                                        ));
                                                  } else {
                                                    favoritesProvider
                                                        .createFav({
                                                      "id": sneaker.id,
                                                      "name": sneaker.name,
                                                      "category":
                                                          sneaker.category,
                                                      "price": sneaker.price,
                                                      "imageUrl":
                                                          sneaker.imageUrl[0]
                                                    });
                                                  }
                                                },
                                                child: favoritesProvider.ids
                                                        .contains(sneaker.id)
                                                    ? const Icon(Icons.favorite)
                                                    : const Icon(
                                                        Icons.favorite_outline),
                                              );
                                            },
                                          )),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.26,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                            sneaker.imageUrl.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor: productProvider
                                                            .activePage !=
                                                        index
                                                    ? gray
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.575,
                                  width: MediaQuery.of(context).size.width,
                                  color: white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          reusableText(
                                            title: sneaker.name,
                                            style: appstyle(
                                                30, black, FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              reusableText(
                                                title: sneaker.category,
                                                style: appstyle(
                                                    13, gray, FontWeight.w300),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              RatingBar.builder(
                                                initialRating: 4,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 22,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 1),
                                                onRatingUpdate: (rating) {},
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: goldColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              reusableText(
                                                title: "\$${sneaker.price}",
                                                style: appstyle(
                                                    14, black, FontWeight.w400),
                                              ),
                                              Row(
                                                children: [
                                                  reusableText(
                                                    title: 'Colors',
                                                    style: appstyle(14, black,
                                                        FontWeight.w400),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: black,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: red,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  reusableText(
                                                    title: 'Select Size',
                                                    style: appstyle(18, black,
                                                        FontWeight.w500),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  reusableText(
                                                    title: 'View Size guide',
                                                    style: appstyle(18, black,
                                                        FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 7),
                                              SizedBox(
                                                height: 35,
                                                child: ListView.builder(
                                                  itemCount: productProvider
                                                      .shoeSizes.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final sizes =
                                                        productProvider
                                                            .shoeSizes[index];
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0),
                                                      child: ChoiceChip(
                                                        showCheckmark: false,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          side:
                                                              const BorderSide(
                                                            color: black,
                                                            width: 1,
                                                            style: BorderStyle
                                                                .solid,
                                                          ),
                                                        ),
                                                        disabledColor: white,
                                                        label: reusableText(
                                                            title:
                                                                sizes['size'],
                                                            style: appstyle(
                                                                16,
                                                                sizes['isSelected']
                                                                    ? white
                                                                    : black38,
                                                                FontWeight
                                                                    .w400)),
                                                        selectedColor: black,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8),
                                                        selected:
                                                            sizes['isSelected'],
                                                        onSelected: (newState) {
                                                          if (productProvider
                                                              .sizes
                                                              .contains(sizes[
                                                                  'size'])) {
                                                            productProvider
                                                                .sizes
                                                                .remove(sizes[
                                                                    'sizes']);
                                                          } else {
                                                            productProvider
                                                                .sizes
                                                                .add(sizes[
                                                                    'size']);
                                                          }
                                                          productProvider
                                                              .toggleCheck(
                                                                  index);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          const Divider(
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Text(sneaker.title,
                                                style: appstyle(18, black,
                                                    FontWeight.w500)),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            sneaker.description,
                                            textAlign: TextAlign.justify,
                                            maxLines: 4,
                                            style: appstyle(
                                                14, black, FontWeight.normal),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 7),
                                              child: CheckoutButton(
                                                label: 'Add to Cart',
                                                onTap: () async {
                                                  cartProvider.createCart({
                                                    "id": sneaker.id,
                                                    "name": sneaker.name,
                                                    "category":
                                                        sneaker.category,
                                                    "sizes":
                                                        productProvider.sizes,
                                                    "imageUrl":
                                                        sneaker.imageUrl[0],
                                                    "price": sneaker.price,
                                                    "qty": 1
                                                  });
                                                  productProvider.sizes.clear();
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
