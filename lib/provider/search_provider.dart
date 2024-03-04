import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

class SearchProvider extends ChangeNotifier {
  late List<SneakersModel> _allSneakers;
  List<SneakersModel> _filteredSneakers = [];

  SearchProvider() {
    _loadSneakers();
  }

  Future<void> _loadSneakers() async {
    _allSneakers = await Helper().getSearchSneakers();
  }

  List<SneakersModel> get filteredSneakers => _filteredSneakers;

  void search(String query) {
    _filteredSneakers = _allSneakers.where((sneaker) =>
      sneaker.name.toLowerCase().contains(query.toLowerCase()) ||
      sneaker.id.toLowerCase() == query.toLowerCase()
    ).toList();
    notifyListeners();
  }
}
