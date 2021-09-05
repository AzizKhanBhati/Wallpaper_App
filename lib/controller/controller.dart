import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinewallpaperapp/model/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:onlinewallpaperapp/model/walpaper_model.dart';
import 'package:onlinewallpaperapp/views/search.dart';

class Controller extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = new ScrollController();
  var noOfImageToLoad = 30;
  var apiKEY = "563492ad6f91700001000001fa5651f1742845e289d8df4547593abf";

  var photos = <WallpaperModel>[].obs;
  var searchedPhotos = <WallpaperModel>[].obs;

  getWallpaper() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=1"),
        headers: {"Authorization": apiKEY}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        WallpaperModel photosModel = new WallpaperModel();
        photosModel = WallpaperModel.fromMap(element);
        photos.add(photosModel);
      });
    });
  }

  @override
  void onInit() {
    print("start");
    getWallpaper();
    super.onInit();
  }

  getSearchedWallpapers({required String query}) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=$noOfImageToLoad&page=1"),
        headers: {"Authorization": apiKEY}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        WallpaperModel photosModel = new WallpaperModel();
        photosModel = WallpaperModel.fromMap(element);
        searchedPhotos.add(photosModel);
      });
    });
  }

  search() {
    if (textController.text.isNotEmpty) {
      searchedPhotos.clear();
      var query = textController.text.trim();
      Get.to(
          () => Search(
                searchQuery: query.toUpperCase(),
              ),
          transition: Transition.cupertinoDialog,
          duration: Duration(milliseconds: 500));
      getSearchedWallpapers(query: textController.text);
      textController.clear();
    } else {
      Get.snackbar("Error", "please enter the field",
          snackPosition: SnackPosition.BOTTOM,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          duration: Duration(seconds: 2),
          isDismissible: true,
          backgroundColor: Colors.white70);
    }
  }

  category(String query) {
    searchedPhotos.clear();
    Get.to(
        () => Search(
              searchQuery: query.toUpperCase(),
            ),
        transition: Transition.cupertinoDialog,
        duration: Duration(milliseconds: 500));
    getSearchedWallpapers(query: query);
  }
}

/// category list
class Data {
  static List<CategoryModel> categoryList = [
    CategoryModel(
        categoryName: "Street Art",
        imgUrl:
            "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    CategoryModel(
        categoryName: "Wild Life",
        imgUrl:
            "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    CategoryModel(
        categoryName: "Nature",
        imgUrl:
            "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    CategoryModel(
        categoryName: "City",
        imgUrl:
            "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    CategoryModel(
        categoryName: "Motivation",
        imgUrl:
            "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
    CategoryModel(
        categoryName: "Bikes",
        imgUrl:
            "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    CategoryModel(
        categoryName: "Cars",
        imgUrl:
            "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
  ];
}
