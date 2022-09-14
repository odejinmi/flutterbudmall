import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbudmall/src/request/env_variable.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/categoperser.dart';
import '../model/featuredproductsperser.dart';
import '../model/latestproductsperser.dart';
import '../model/superpackperser.dart';
import '../model/topsellingproductsperser.dart';
import '../request/apis.dart';

class Dashboardcontroller extends GetxController {
  var isLoading = false.obs;
  var buttonposition = false.obs;
  var emailController = TextEditingController().obs;
  // var size = Size.obs;
  var left = 2.0.obs, right = 0.0.obs;
  var formKey = GlobalKey<FormState>().obs;
  var category = [].obs;
  var featuredproduct = [].obs;
  var latestproduct = [].obs;
  var offers = [].obs;
  var superpack = [].obs;
  var topsellingproducts = [].obs;
  @override
  void onInit() {
    super.onInit();
    // step.value = 0;
    initiate();
    initiateSlider();
  }

  void initiate() async {
    String res;

    isLoading.value = true;

    res = await dashboard();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      category.value =
          categoperserFromJson(jsonEncode(cmddetails['data']['catego']));
      featuredproduct.value = featuredproductsperserFromJson(
          jsonEncode(cmddetails['data']['featuredProducts']));
      latestproduct.value = latestproductsperserFromJson(
          jsonEncode(cmddetails['data']['latestProducts']));
      offers.value = latestproductsperserFromJson(
          jsonEncode(cmddetails['data']['offers']));
      superpack.value =
          superpackperserFromJson(jsonEncode(cmddetails['data']['superpack']));
      topsellingproducts.value = topsellingproductsperserFromJson(
          jsonEncode(cmddetails['data']['topSellingProducts']));
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  void initiateSlider() async {
    String res;

    isLoading.value = true;

    res = await sliders();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    print("res");
    print(res);

    if (cmddetails['status']) {
      for (var i = 0; i < cmddetails['data'].length; i++) {
        var img = cmddetails['data'][i]['data_values']['slider'] ??
            cmddetails['data'][i]['data_values']['image'];
        var img_url = imageurl +
            "frontend/" +
            cmddetails['data'][i]['data_keys'].toString().split('.')[0] +
            "/" +
            img;

        print("img_url");
        print(img_url);

        bannerList.add(img_url);
      }
      print("bannerList");
      print(bannerList);
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
