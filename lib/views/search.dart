import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinewallpaperapp/controller/controller.dart';
import 'package:onlinewallpaperapp/views/parallaxView.dart';
import 'package:onlinewallpaperapp/widgets/wallpaperGridView.dart';

class Search extends StatelessWidget {
  final controller = Get.find<Controller>();

  final String searchQuery;
  bool show = false;

  Search({Key? key, this.searchQuery = "Nature"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          searchQuery,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Obx(
          () {
            return wallPaper(controller.searchedPhotos);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => ParallaxView(photos: controller.searchedPhotos));
        },
        label: Text("Parallax"),
        icon: Icon(Icons.arrow_forward),
        backgroundColor: Colors.black.withOpacity(.75),
      ),
    );
  }
}
