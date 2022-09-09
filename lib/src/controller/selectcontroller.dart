import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/countrylistparser.dart';
import '../request/apis.dart';

class Selectcountrycontroller extends GetxController {
  var isLoading = false.obs;
  var countryname = "".obs;
  var countryflag = "".obs;
  var selectedlist = false.obs;
  @override
  void onInit() {
    super.onInit();
    initiate();
  }

  var selected = 0.obs;
  List<Countrylistparser> originList = [];
  List<Countrylistparser> originListSearched = [];
  void initiate() async {
    String res;

    isLoading.value = true;

    res = await getcountries();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      originList = countrylistparserFromJson(json.encode(cmddetails['data']));
      originListSearched =
          countrylistparserFromJson(json.encode(cmddetails['data']));
      countryname.value = originList[0].name!;
      countryflag.value = originList[0].flag!;
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
