import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

save({required String imgPath, required BuildContext context}) async {
  await Permission.storage.request();
  var response = await Dio()
      .get(imgPath, options: Options(responseType: ResponseType.bytes));
  await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  Get.back();
  Get.snackbar("Saved", "Image is saved in your device's gallery.",
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      duration: Duration(seconds: 1),
      isDismissible: true,
      backgroundColor: Colors.white70);
}
