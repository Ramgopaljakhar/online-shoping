import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getMale();
    productProvider.getFemale();
    productProvider.getKids();

    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    favoritesProvider.getFavorites();
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(color: black),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText(
                        title: 'Athletics Shoes',
                        style: appstyleWithHt(25, white, FontWeight.bold, 1),
                      ),
                      reusableText(
                        title: 'Collection',
                        style: appstyleWithHt(25, white, FontWeight.bold, 1),
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: _tabController,
                        unselectedLabelColor: gray.withOpacity(0.3),
                        isScrollable: true,
                        labelColor: white,
                        labelStyle: appstyle(20, white, FontWeight.bold),
                        tabs: const [
                          Tab(text: "Men Shoes"),
                          Tab(text: "Women Shoes"),
                          Tab(text: "Kids Shoes"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.260),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(male: productProvider.male, tabIndex: 0),
                    HomeWidget(male: productProvider.female, tabIndex: 1),
                    HomeWidget(
                      male: productProvider.kids,
                      tabIndex: 2,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
