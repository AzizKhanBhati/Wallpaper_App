import 'package:flutter/material.dart';
import 'package:onlinewallpaperapp/widgets/saveImage_askPermission.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;

  const ImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                save(
                    imgPath: imageUrl,
                    context: context); // for saving image in gallery
              },
              child: Container(
                height: 40,
                width: 180,
                margin: EdgeInsets.only(bottom: 64),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white54, width: 1),
                    gradient: LinearGradient(colors: [
                      Color(0x36ffffff),
                      Color(0xf090808),
                    ])),
                child: Center(
                  child: Text(
                    "Download",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
