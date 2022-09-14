import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/buydataperser.dart';
import '../request/apis.dart';

class Cabletvcontroller extends GetxController {
  var amountController = TextEditingController().obs;
  var iucController = TextEditingController().obs;
  var customername = TextEditingController().obs;
  var type = "Box Office".obs;
  var isLoading = false.obs;
  var network = "Mtn".obs;
  var buydataperser = [].obs;
  var buydataperser1 = [].obs;
  var selectedplan = "".obs;

  @override
  void onInit() {
    super.onInit();
    // step.value = 0;
    fetchbuydata();
  }

  void fetchbuydata() async {
    String res;

    isLoading.value = true;

    res = await getcabletv();

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

  void initiate(context) async {
    String res;

    isLoading.value = true;

    var jsonBody = {
      "number": iucController.value.text,
      "decoder": network.value,
      "plan": selectedplan.value
    };
    res = await validateiuc(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      customername.value.text = cmddetails['data'];
    } else {
      if (cmddetails['message'] != "No internet connection") {
        showCommonError(cmddetails['message'], context);
      }
    }
  }

  void puycabletv(context) async {
    String res;

    isLoading.value = true;

    var jsonBody = {
      "number": iucController.value.text,
      "customer": customername.value.text,
      "plan": selectedplan.value
    };
    res = await paycabletv(jsonBody);

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
}
