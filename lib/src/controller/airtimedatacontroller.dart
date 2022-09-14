import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/buydataperser.dart';
import '../request/apis.dart';

class Airtimedatacontroller extends GetxController {
  var isLoading = false.obs;
  var amountController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var type = "Mobile Top-up".obs;
  var plan = "Select plan".obs;
  var selectedplan = "".obs;
  var network = "Mtn".obs;
  var buydataperser = [].obs;
  var buydataperser1 = [].obs;
  @override
  void onInit() {
    super.onInit();
    // step.value = 0;
    fetchbuydata();
  }

  void initiate(context) async {
    String res;

    isLoading.value = true;

    if (type.value == "Data bundle") {
      var jsonBody = {
        "phone": phoneController.value.text,
        "network": network.value,
        "plan": selectedplan.value
      };
      res = await buydata(jsonBody);
    } else {
      var jsonBody = {
        "phone": phoneController.value.text,
        "network": network.value,
        "amount": amountController.value.text
      };
      res = await buyairtime(jsonBody);
    }

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      showCommonSuccess(cmddetails['message'], context);
    } else {
      if (cmddetails['message'] != "No internet connection") {
        showCommonError(cmddetails['message'], context);
      }
    }
  }

  void fetchbuydata() async {
    String res;

    isLoading.value = true;

    res = await getbuydata();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      buydataperser1.value =
          buydataperserFromJson(jsonEncode(cmddetails['data']));
      buydataperser.value = buydataperser1.value.where((v) {
        return v.network!.toLowerCase().contains(network.value.toLowerCase());
      }).toList();
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
