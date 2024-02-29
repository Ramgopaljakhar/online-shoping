import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();

    _tabController.animateTo(widget.tabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas_logo.png",
    "assets/images/Gucci_Logo.png",
    "assets/images/jordan_logo.png",
    "assets/images/nike_logo.png"
  ];

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getFemale();
    productProvider.getMale();
    productProvider.getKids();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 10, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const FaIcon(FontAwesomeIcons.sliders,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    unselectedLabelColor: gray.withOpacity(0.3),
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(20, Colors.white, FontWeight.bold),
                    tabs: const [
                      Tab(text: "Men Shoes"),
                      Tab(text: "Women Shoes"),
                      Tab(text: "Kids Shoes"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.260,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TabBarView(controller: _tabController, children: [
                  LatestShoes(male: productProvider.male),
                  LatestShoes(male: productProvider.female),
                  LatestShoes(male: productProvider.kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

// fliter
  Future<dynamic> filter() {
    double value = 100;
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      isScrollControlled: true,
      builder: (context) => Container(
          width: MediaQuery.of(context).size.width,
          height: 680.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.h),
                  topRight: Radius.circular(25.h))),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 5,
                width: 40,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: black38),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    const CustomSpacer(),
                    Text('Filter', style: appstyle(30, black, FontWeight.bold)),
                    const CustomSpacer(),
                    Text(
                      'Gender',
                      style: appstyle(20, black, FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Row(
                      children: [
                        CategoryBtn(buttonClr: black, lable: "Men"),
                        CategoryBtn(buttonClr: gray, lable: "Women"),
                        CategoryBtn(buttonClr: gray, lable: "Kids")
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      'Category',
                      style: appstyleWithHt(20, black, FontWeight.w600, 1),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Row(
                      children: [
                        CategoryBtn(buttonClr: gray, lable: 'Shoes'),
                        CategoryBtn(buttonClr: gray, lable: 'Apparrels'),
                        CategoryBtn(buttonClr: gray, lable: 'Accessori')
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      'Price',
                      style: appstyleWithHt(20, black, FontWeight.w600, 1),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Slider(
                      value: value,
                      activeColor: black,
                      inactiveColor: gray,
                      thumbColor: black,
                      divisions: 50,
                      label: value.toString(),
                      max: 500,
                      secondaryTrackValue: 200,
                      onChanged: (double value) {},
                    ),
                    const CustomSpacer(),
                    Text(
                      'Brand',
                      style: appstyleWithHt(20, black, FontWeight.w600, 1),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: brand.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: gray200,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: Image.asset(
                                brand[index],
                                fit: BoxFit.fill,
                                height: 60,
                                width: 60,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
