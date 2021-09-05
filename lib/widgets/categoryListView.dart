import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onlinewallpaperapp/controller/controller.dart';

Widget categoryView(Size size, Controller controller) {
  return Container(
    height: size.height * .075,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: Data.categoryList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => controller
              .category(Data.categoryList[index].categoryName.toString()),
          child: Container(
            margin: EdgeInsets.only(right: 8),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: kIsWeb
                      ? Image.network(
                          Data.categoryList[index].imgUrl!,
                          height: size.height * .065,
                          width: size.width * .275,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: Data.categoryList[index].imgUrl!,
                          height: size.height * .065,
                          width: size.width * .275,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12)),
                  height: size.height * .065,
                  width: size.width * .275,
                  alignment: Alignment.center,
                  child: Text(
                    Data.categoryList[index].categoryName!,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
