import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinewallpaperapp/views/parallaxFunctions.dart';

class ParallaxView extends StatelessWidget {
  final photos;
  const ParallaxView({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "Parallax View",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final photo in photos)
              LocationListItem(
                imageUrl: photo.src!.portrait!,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.back();
        },
        label: Text("Back"),
        icon: Icon(Icons.arrow_back),
        backgroundColor: Colors.black.withOpacity(.75),
      ),
    );
  }
}
