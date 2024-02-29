import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';


class LatestShoes extends StatelessWidget {
  const LatestShoes({super.key, required Future<List<SneakersModel>> male})
      : _male = male;
  final Future<List<SneakersModel>> _male;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SneakersModel>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        } else {
          final male = snapshot.data;
          return StaggeredGridView.countBuilder(
            itemCount: male!.length,
            padding: EdgeInsets.zero,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            staggeredTileBuilder: (index) => StaggeredTile.extent(
                (index % 2 == 0) ? 1 : 1,
                (index % 4 == 1 || index % 4 == 3) ? 285.h : 270.h),
            itemBuilder: (context, index) {
              final shoe = snapshot.data![index];
              return StaggerTile(
                imageUrl: shoe.imageUrl[1],
                name: shoe.name,
                price: shoe.price,
              );
            },
          );
        }
      },
    );
  }
}
