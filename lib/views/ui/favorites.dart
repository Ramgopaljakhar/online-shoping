import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    favoritesProvider.getAllData();
    return Scaffold(
      // appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: black),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'My Favorites',
                  style: appstyle(25, white, FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: favoritesProvider.fav.length,
                padding: const EdgeInsets.only(top: 100),
                itemBuilder: (context, index) {
                  final shoe = favoritesProvider.fav[index];

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: gray100,
                          boxShadow: [
                            BoxShadow(
                              color: gray500,
                              blurRadius: 0.3,
                              spreadRadius: 5,
                              offset: const Offset(0, 1),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (shoe['imageUrl'] != null &&
                                    shoe['imageUrl'].isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.network(
                                      shoe['imageUrl'],
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                else
                                  Container(
                                    width: 0,
                                    height: 70,
                                    color: Colors.grey, // Placeholder color
                                  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 11, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(shoe['name'],
                                          style: appstyle(
                                              13, black, FontWeight.w600)),
                                      const SizedBox(height: 5),
                                      Text(shoe['category'],
                                          style: appstyle(
                                              13, gray, FontWeight.w400)),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(shoe['price'],
                                              style: appstyle(
                                                  16, black, FontWeight.w500))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  favoritesProvider.deleteFav(shoe['key']);
                                  favoritesProvider.ids.removeWhere(
                                      (element) => element == shoe['id']);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>  MainScreen(),
                                      ));
                                },
                                child: const Icon(Ionicons.heart_dislike_sharp),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
