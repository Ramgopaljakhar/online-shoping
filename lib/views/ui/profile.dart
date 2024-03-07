import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';
import 'package:online_shop/views/shared/tiles_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE2E2E2),
          elevation: 0,
          leading: const Icon(
            Icons.qr_code_scanner,
            size: 18,
            color: black,
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/us.jpg',
                      width: 25.w,
                      height: 40.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 20.h,
                      width: 1.w,
                      color: gray,
                    ),
                    reusableText(
                        title: " USA",
                        style: appstyle(16, black, FontWeight.normal)),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(),
                      child: Icon(
                        Icons.settings,
                        size: 20,
                        color: black,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 65.h,
              decoration: const BoxDecoration(color: Color(0xFFE2E2E2)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 10, 16, 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 45.h,
                                width: 40.w,
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/images (2).jpeg'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  reusableText(
                                      title: 'Username',
                                      style: appstyle(
                                          9, black, FontWeight.normal)),
                                  reusableText(
                                      title: 'ram1234@gmail.com',
                                      style:
                                          appstyle(9, black, FontWeight.normal))
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child:
                                  const Icon(FontAwesomeIcons.edit, size: 18),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 170.h,
                  color: gray200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        tilesWidget(context, onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FavoritesPage(),
                              ));
                        }, title: 'My Orders', leading: Icons.local_shipping),
                        tilesWidget(context, onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FavoritesPage(),
                              ));
                        },
                            title: 'My Favorites',
                            leading: FontAwesomeIcons.heart),
                        tilesWidget(context, onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              ));
                        }, title: 'Cart', leading: Fontisto.shopping_bag_1)
                      ]),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 130.h,
                  color: gray200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        tilesWidget(context,
                            onTap: () {},
                            title: 'Coupons',
                            leading: MaterialCommunityIcons.tag_outline),
                        tilesWidget(context,
                            onTap: () {},
                            title: 'My Store',
                            leading: MaterialCommunityIcons.shopping_outline)
                      ]),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 170.h,
                  color: gray200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        tilesWidget(context,
                            onTap: () {},
                            title: 'Shipping addresses',
                            leading: SimpleLineIcons.location_pin),
                        tilesWidget(context,
                            onTap: () {},
                            title: 'Settings',
                            leading: AntDesign.setting),
                        tilesWidget(context,
                            onTap: () {},
                            title: 'Logout',
                            leading: AntDesign.logout)
                      ]),
                ),
              ],
            )
          ]),
        ));
  }
}
