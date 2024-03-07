import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Cart',
                  style: appstyle(26, black, FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: ListView.builder(
                      itemCount: cartProvider.cart.length,
                      itemBuilder: (context, index) {
                        final data = cartProvider.cart[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Slidable(
                              key: ValueKey(data['key']),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: (context) {},
                                    backgroundColor: const Color(0xFF000000),
                                    foregroundColor: white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  )
                                ],
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: gray100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: gray500,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Image.network(
                                                data['imageUrl'],
                                                width: 70,
                                                height: 70,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Positioned(
                                                bottom: -2,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    cartProvider.deleteCart(
                                                        data['key']);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              MainScreen(),
                                                        ));
                                                  },
                                                  child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: const BoxDecoration(
                                                          color: black,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          13))),
                                                      child: const Icon(
                                                          Icons.delete,
                                                          color: white)),
                                                ))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 11, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['name'],
                                                style: appstyle(
                                                    15, black, FontWeight.w500),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                data['category'],
                                                style: appstyle(
                                                    13, black, FontWeight.w500),
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "\$${data['price']}",
                                                    style: appstyle(13, black,
                                                        FontWeight.w400),
                                                  ),
                                                  const SizedBox(width: 11),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Size :',
                                                        style: appstyle(
                                                            13,
                                                            gray,
                                                            FontWeight.w300),
                                                      ),
                                                      Text(
                                                        data['sizes']
                                                            .toString(),
                                                        style: appstyle(
                                                            13,
                                                            gray,
                                                            FontWeight.w300),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        color: gray,
                                                      ),
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: white,
                                                        size: 20,
                                                      ),
                                                    )),
                                                Text(data['qty'].toString(),
                                                    style: appstyle(16, black,
                                                        FontWeight.w400)),
                                                InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        color: black,
                                                      ),
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: white,
                                                        size: 20,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed to Checkout"),
            )
          ],
        ),
      ),
    );
  }
}
