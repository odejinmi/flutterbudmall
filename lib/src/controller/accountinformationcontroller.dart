import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/cart.dart';
import '../constant/constant.dart';
import '../model/countrylistparser.dart';
import '../request/apis.dart';
import 'itemcountercontroller.dart';

class Accountinformationcontroller extends GetxController {
  var isLoading = false.obs;
  var nDatalist;
  var itemcountercontroller = Get.put(Itemcountercontroller());

  TextEditingController nameController =
      TextEditingController(text: '$firstname $lastname');
  TextEditingController usernameController =
      TextEditingController(text: '$username');
  TextEditingController emailController = TextEditingController(text: '$email');
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  void add() async {
    String res;

    isLoading.value = true;
    var jsonBody = {
      "product_id": nDatalist.id.toString(),
      "quantity": itemcountercontroller.count.value.toString()
    };
    res = await addcart(jsonBody);

    var cmddetails = jsonDecode(res);

    isLoading.value = false;

    if (cmddetails['status']) {
      Get.to(() => const Cart());
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
