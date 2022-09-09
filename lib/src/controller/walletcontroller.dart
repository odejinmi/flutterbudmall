import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/custom_alert_dialog.dart';
import '../model/addressperser.dart';
import '../request/apis.dart';

class Walletcontroller extends GetxController {
  var isLoading = false.obs;
  // var type = "Mobile Top-up".obs;
  // var plan = "Select plan".obs;
  // var selectedplan = "".obs;
  // var network = "Mtn".obs;
  var buydataperser = [].obs;
  var buydataperser1 = [].obs;

  var visible = true.obs;
  @override
  void onInit() {
    super.onInit();
    // step.value = 0;
    fetchbuydata();
    fetchtransaction();
  }

  // void initiate(context) async {
  //   String res;
  //
  //
  //     isLoading.value = true;
  //
  //     var jsonBody = {
  //       "country": countryController.value.text,
  //       "address": addressController.value.text,
  //       "name": nameController.value.text,
  //       "phone_number": phoneController.value.text
  //     };
  //     res = await address(jsonBody);
  //
  //     isLoading.value = false;
  //
  //   var cmddetails = jsonDecode(res);
  //
  //   if (cmddetails['status']) {
  //     CustomAlertDialogloader(
  //         context: context,
  //         title: "Whoops!!",
  //         message: cmddetails['message'],
  //         negativeBtnText: 'Dismiss',
  //         onPostivePressed: () {},
  //         onNegativePressed: () {
  //           fetchbuydata();
  //           Get.back();
  //         }
  //     );
  //   } else {
  //     if (cmddetails['message'] != "No internet connection") {
  //       showCommonError(cmddetails['message'], context);
  //     }
  //   }
  // }

  void fetchbuydata() async {
    String res;

    isLoading.value = true;

    res = await getwalletbalance();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      balance.value = cmddetails['data'];
      // buydataperser.value = addressperserFromJson(jsonEncode(cmddetails['data']));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  void fetchtransaction() async {
    String res;

    isLoading.value = true;

    res = await gettransaction();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      // buydataperser.value = addressperserFromJson(jsonEncode(cmddetails['data']));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
