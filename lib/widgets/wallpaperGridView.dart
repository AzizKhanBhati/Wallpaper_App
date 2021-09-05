import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinewallpaperapp/model/walpaper_model.dart';
import 'package:onlinewallpaperapp/views/imageView.dart';

Widget wallPaper(List<WallpaperModel> photos) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: photos.map((photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Get.to(() => ImageView(
                    imageUrl: photoModel.src!.portrait!,
                  ));
            },
            child: Hero(
              tag: photoModel.src!.portrait!,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: kIsWeb
                      ? Image.network(
                          photoModel.src!.portrait!,
                          height: 50,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: photoModel.src!.portrait!,
                          placeholder: (context, url) => Container(),
                          fit: BoxFit.cover),
                ),
              ),
            ),
          ));
        }).toList()),
  );
}
