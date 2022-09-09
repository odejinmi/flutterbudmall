import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/custom_alert_dialog.dart';
import '../model/addressperser.dart';
import '../request/apis.dart';

class Deliveryaddresscontroller extends GetxController {
  var isLoading = false.obs;
  var countryController = TextEditingController(text: country.value).obs;
  var nameController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
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

    var jsonBody = {
      "country": countryController.value.text,
      "address": addressController.value.text,
      "name": nameController.value.text,
      "phone_number": phoneController.value.text
    };
    res = await address(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      CustomAlertDialogloader(
          context: context,
          title: "Whoops!!",
          message: cmddetails['message'],
          negativeBtnText: 'Dismiss',
          onPostivePressed: () {},
          onNegativePressed: () {
            fetchbuydata();
            Get.back();
          });
    } else {
      if (cmddetails['message'] != "No internet connection") {
        showCommonError(cmddetails['message'], context);
      }
    }
  }

  void fetchbuydata() async {
    String res;

    isLoading.value = true;

    res = await getaddress();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      buydataperser.value =
          addressperserFromJson(jsonEncode(cmddetails['data']));
      for (int i = 0; i < buydataperser.length; i++) {
        if (buydataperser[i].defaulty == 1) {
          defaultaddress = i;
        } else {
          defaultaddress = 0;
        }
      }
      // shippingfe();
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  void shippingfe() async {
    String res;

    isLoading.value = true;
    var jsonBody = {
      "shipping_method": "doordelivery",
      "address": buydataperser[0].address,
      "state": "Lagos"
    };
    res = await shippingfee(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
