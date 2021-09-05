import 'package:flutter/material.dart';
import 'package:onlinewallpaperapp/controller/controller.dart';

Widget mySearchBar(Size size, Controller controller) {
  final Color? bg = Color(0xfff5f8fd);
  return Form(
    key: controller.formKey,
    child: Row(
      children: [
        /// search bar
        Container(
          height: size.height * .065,
          width: size.width * .75,
          child: Card(
            elevation: 0,
            color: bg,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: TextFormField(
              controller: controller.textController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: 14,
                  left: 24,
                  right: 14,
                ),
                border: InputBorder.none,
                hintText: "Nature",
              ),
            ),
          ),
        ),

        SizedBox(
          width: size.width * .035,
        ),

        /// search button
        Container(
          height: size.height * .055,
          width: size.width * .13,
          decoration:
              BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
          child: IconButton(
            onPressed: () => controller.search(),
            icon: Icon(
              Icons.search,
              color: Colors.black.withOpacity(.7),
              size: 24,
            ),
          ),
        )
      ],
    ),
  );
}
