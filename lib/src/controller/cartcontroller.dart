import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Dashboard/dashboard.dart';
import '../account/Myorder/myorder.dart';
import '../constant/constant.dart';
import '../constant/customalertdialogwidget.dart';
import '../constant/submitbutton.dart';
import '../model/cartperser.dart';
import '../request/apis.dart';

class Cartcontroller extends GetxController {
  var isLoading = false.obs;
  var id, count;
  @override
  void onInit() {
    super.onInit();
    initiate();
  }

  var originList = [].obs;
  var total = 0.obs;
  var totalwshipin = 0.obs;

  void initiate() async {
    String res;

    isLoading.value = true;

    res = await getcart();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      originList.value = cartperserFromJson(json.encode(cmddetails['data']));
      caltotal();
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  void checkoutt(context) async {
    String res;

    isLoading.value = true;
    var jsonBody = {
      "shipping_method": "1",
      "firstname": firstname,
      "lastname": lastname,
      "mobile": "123",
      "email": email,
      "location": "abeokuta",
      "state": "ogun",
      "payment": "wallet",
      "notify": "1",
      "type": "1",
      "delivery_calculation": "500",
      "coupon_code": ""
    };
    res = await checkout(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      CustomAlertDialogwidgetloader(
          context: context,
          message: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  package: 'flutterbudmall',
                  "assests/images/success.png",
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Your order is successful.",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'You can track the delivery in the "Orders" section.',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                Submitbutton(
                  name: "Continue Shopping",
                  processed: () {
                    Get.back();
                    Get.offAll(() => const Dashboard());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const Text(
                    "Go to orders",
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                    Get.back();
                    Get.offAll(() => Myorder());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ));
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        showCommonError(cmddetails['message'].toString(), context);
      }
    }
  }

  void caltotal() {
    total.value = 0;
    for (int i = 0; i < originList.length; i++) {
      total.value += int.parse(originList[i].product!.basePrice!);
    }
    totalwshipin.value = total.value + 12;
  }
}
