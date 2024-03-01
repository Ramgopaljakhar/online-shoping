import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Center(
            child: AppBar(
              toolbarHeight: 100.h,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              elevation: 0,
              title: customField(
                hintText: 'Search for a product',
                controller: search,
                onEditingComplete: () {
                  setState(() {});
                },
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.camera_alt, color: Colors.black),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: const Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        body: search.text.isEmpty
            ? Container(
                height: 600.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.h),
                // margin: EdgeInsets.only(right: 5.w),
                child: Image.asset(
                  'assets/images/pose23.png',
                  fit: BoxFit.cover,
                ),
              )
            : Container());
  }
}
