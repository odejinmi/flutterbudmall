import 'dart:convert';

import 'package:flutterbudmall/src/constant/constant.dart';
import 'package:flutterbudmall/src/model/orderperser.dart';
import 'package:get/get.dart';

import '../cart/payment.dart';
import '../request/apis.dart';

class Ordercontroller extends GetxController {
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    initiate();
  }

  var originList = [].obs;

  void initiate() async {
    String res;

    isLoading.value = true;

    res = await getorders();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      originList.value = orderperserFromJson(json.encode(cmddetails['data']));

      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  void shippingfe(context) async {
    String res;

    isLoading.value = true;
    var jsonBody = {
      "shipping_method": "500",
      "address": "Afolabi street Lagos state, Blok 4F No.9",
      "state": "500"
    };
    res = await shippingfee(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      Get.to(() => const Payment());
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        showCommonError(cmddetails['message'], context);
      }
    }
  }

  void checkoutt(context) async {
    String res;

    isLoading.value = true;
    var jsonBody = {
      "shipping_method": 1,
      "firstname": firstname,
      "lastname": lastname,
      "mobile": phonenumber,
      "email": email,
      "location": "abeokuta",
      "state": "ogun",
      "payment": "co",
      "notify": 1,
      "type": 1,
      "delivery_calculation": "500",
      "coupon_code": ""
    };
    res = await checkout(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      Get.to(() => const Payment());
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        showCommonError(cmddetails['message'], context);
      }
    }
  }
}
