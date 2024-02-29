// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

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

//single male
  Future<SneakersModel> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersModelFromJson(data);
    final sneaker =
        maleList.firstWhere((SneakersModel) => SneakersModel.id == id);
    return sneaker;
  }

  //single female
  Future<SneakersModel> getfeMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final maleList = sneakersModelFromJson(data);
    final sneaker =
        maleList.firstWhere((SneakersModel) => SneakersModel.id == id);
    return sneaker;
  }

  //single male
  Future<SneakersModel> getKidsSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final maleList = sneakersModelFromJson(data);
    final sneaker =
        maleList.firstWhere((SneakersModel) => SneakersModel.id == id);
    return sneaker;
  }
}
