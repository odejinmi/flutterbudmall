import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/powerperser.dart';
import '../request/apis.dart';

class Utilitycontroller extends GetxController {
  var amountController = TextEditingController().obs;
  var iucController = TextEditingController().obs;
  var customername = TextEditingController().obs;
  var type = "select plan".obs;
  var isLoading = false.obs;
  var network = "Mtn".obs;
  var buydataperser = [].obs;
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

    res = await getpower();

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      buydataperser.value = powerperserFromJson(jsonEncode(cmddetails['data']));
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
      "company": selectedplan.value,
      "type": type.value.toLowerCase(),
      "amount": amountController.value.text
    };
    res = await validatemeter(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      // customername.value.text = cmddetails['data'];
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
      "company": selectedplan.value,
      "type": type.value.toLowerCase(),
      "amount": amountController.value.text
    };
    res = await paycabletv(jsonBody);

    isLoading.value = false;

    print(res);

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      showCommonSuccess(cmddetails['message'], context);
    } else {
      if (cmddetails['message'] != "No internet connection") {
        showCommonError(cmddetails['message'], context);
      }
    }
  }

  Widget item(item) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          // Image.network(
          //   "${imageurl}${name.image}",
          //   height: 53,
          //   width: 53,
          // ),
          Image.asset(
            package: 'flutterbudmall',
            "assests/images/${item.image.toLowerCase()}",
            height: 53,
            width: 53,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            item.name,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
