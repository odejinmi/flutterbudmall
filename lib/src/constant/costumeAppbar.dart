import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Dashboard/dashboard.dart';

class CostumeAppbar extends AppBar {
  Widget? name;
  Function? pressed;

  CostumeAppbar({name, color = Colors.white, back = true, goback = true, child})
      : super(
            backgroundColor: color,
            leading: back
                ? IconButton(
                    onPressed: () {
                      if (goback) {
                        Get.back();
                      } else {
                        Get.to(() => Dashboard());
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ))
                : const Text(""),
            centerTitle: true,
            title: name ??
                Container(
                  width: 10,
                ),
            titleTextStyle: const TextStyle(),
            elevation: 0.0,
            actions: [
              child ?? Container(),
              child != null
                  ? const SizedBox(
                      width: 20,
                    )
                  : Container(),
            ]);
}
