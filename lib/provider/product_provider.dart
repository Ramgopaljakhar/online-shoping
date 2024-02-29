import 'package:flutter/material.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/services/helper.dart';

class ProductProvider extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

  int get activePage => _activePage;

  set activePage(int newIndex) {
    _activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;

  set shoesSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]['isSelected'] = true;
      } else {
        _shoeSizes[i]['isSelected'] = false;
      }
    }

    notifyListeners();
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }

  late Future<List<SneakersModel>> male;
  late Future<List<SneakersModel>> female;
  late Future<List<SneakersModel>> kids;
  late Future<SneakersModel> sneaker;

  void getMale() {
    male = Helper().getMaleSneakers();
  }

  void getFemale() {
    female = Helper().getFemaleSneakers();
  }

  void getKids() {
    kids = Helper().getKidsSneakers();
  }

  void getShoes(String category, String id) {
    if (category == "men's Running") {
      sneaker = Helper().getKidsSneakersById(id);
    } else if (category == "women's Running") {
      sneaker = Helper().getMaleSneakersById(id);
    } else {
      sneaker = Helper().getMaleSneakersById(id);
    }
  }
}
