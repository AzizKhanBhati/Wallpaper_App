import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinewallpaperapp/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      );
}
