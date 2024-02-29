import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
        builder: (context, mainScreenProvider, child) {
      return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenProvider.pageIndex],
          bottomNavigationBar: const BottomNavBar());
    });
  }
}
