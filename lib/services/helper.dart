import 'package:flutter/services.dart' as the_bundle;
import 'package:online_shop/models/sneaker_model.dart';

class Helper {
  Future<List<SneakersModel>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = sneakersModelFromJson(data);
    return maleList;
  }

  Future<List<SneakersModel>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = sneakersModelFromJson(data);
    return femaleList;
  }

  Future<List<SneakersModel>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = sneakersModelFromJson(data);
    return kidsList;
  }

 Future<List<SneakersModel>> combineSneakersData() async {
  List<SneakersModel> commonArray = [];

  final maleList = await getMaleSneakers();
  final femaleList = await getFemaleSneakers();
  final kidsList = await getKidsSneakers();

  commonArray.addAll(maleList);
  commonArray.addAll(femaleList);
  commonArray.addAll(kidsList);

  return commonArray;
}


  // Get single male sneaker by ID
  Future<SneakersModel> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersModelFromJson(data);
    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }

  // Get single female sneaker by ID
  Future<SneakersModel> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = sneakersModelFromJson(data);
    final sneaker = femaleList.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }

  // Get single kids sneaker by ID
  Future<SneakersModel> getKidsSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = sneakersModelFromJson(data);
    final sneaker = kidsList.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }

  // Get single search sneaker by ID
  Future<SneakersModel> getSearchSneakerById(String name) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/search_shoes.json");
    final searchList = sneakersModelFromJson(data);
    final sneaker = searchList.firstWhere((sneaker) => sneaker.name == name);
    return sneaker;
  }

  // Future<List<SneakersModel>> Search(String searchQuery) async {
  //   var url = Uri.http(Confing.apiUrl, "${Confing.search}$searchQuery");
  //   var response = await Client.get(url);
  //   if (response.statusCode == 200) {
  //     final results = sneakersModelFromJson(response.body);
  //     return results;
  //   } else {
  //     throw Exception('Failed get sneakers list');
  //   }
  // }
}
