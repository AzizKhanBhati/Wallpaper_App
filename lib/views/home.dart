import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinewallpaperapp/controller/controller.dart';
import 'package:onlinewallpaperapp/views/parallaxFunctions.dart';
import 'package:onlinewallpaperapp/views/parallaxView.dart';
import 'package:onlinewallpaperapp/widgets/categoryListView.dart';
import 'package:onlinewallpaperapp/widgets/searchbar.dart';
import 'package:onlinewallpaperapp/widgets/wallpaperGridView.dart';

class Home extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HD",
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Wallpapers",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                mySearchBar(size, controller),
                SizedBox(
                  height: 16,
                ),
                categoryView(size, controller),
                SizedBox(
                  height: 16,
                ),
                Obx(
                  () => wallPaper(controller.photos),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => ParallaxView(photos: controller.photos));
        },
        label: Text("Parallax"),
        icon: Icon(Icons.arrow_forward),
        backgroundColor: Colors.black.withOpacity(.75),
      ),
    );
  }
}
