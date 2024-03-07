//import
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.category,
      required this.id,
      required this.image,
      required this.name,
      required this.price});

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final _favBox = Hive.box('fav_box');
  Future<void> _createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
  }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {"key": key, "id": "id"};
    }).toList();
    favor = favData.toList();
    ids = favor.map((item) => item['id']).toList();
  }

  @override
  Widget build(BuildContext context) {
    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    favoritesProvider.getFavorites();
    bool selected = true;
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1),
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.image,
                              ),
                              fit: BoxFit.fill)),
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () async {
                            if (ids.contains(widget.id)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FavoritesPage(),
                                  ));
                            } else {
                              favoritesProvider.createFav({
                                "id": widget.id,
                                "name": widget.name,
                                "category": widget.category,
                                "price": widget.price,
                                "imageUrl": widget.image
                              });
                            }
                          },
                          child: ids.contains(widget.id)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_outline),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText(
                          title: widget.name,
                          style:
                              appstyleWithHt(20, black, FontWeight.bold, 1.1)),
                      SizedBox(
                        height: 2.h,
                      ),
                      reusableText(
                          title: widget.category,
                          style:
                              appstyleWithHt(13, gray, FontWeight.w400, 1.1)),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8, right: 5, top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        reusableText(
                            title: widget.price,
                            style: appstyle(
                              18,
                              black,
                              FontWeight.w600,
                            )),
                        Row(
                          children: [
                            reusableText(
                              title: 'Colors',
                              style: appstyle(11, gray, FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 40,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors
                                    .grey[200], // Example background color
                              ),
                              child: Center(
                                child: ChoiceChip(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  label: const SizedBox.shrink(),
                                  selected: selected,
                                  visualDensity: VisualDensity.compact,
                                  selectedColor: Colors.black,
                                  onSelected: (bool selected) {
                                    // Handle selection logic here
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
