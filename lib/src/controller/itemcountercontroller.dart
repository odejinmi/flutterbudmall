import 'dart:convert';

import 'package:get/get.dart';

import '../request/apis.dart';
import 'cartcontroller.dart';

class Itemcountercontroller extends GetxController {
  var isLoading = false.obs;
  var available = "".obs, cart = false.obs, id = 0.obs;

  var count = 1.obs;

  var cartcontroller = Get.put(Cartcontroller());
  @override
  void onInit() {
    super.onInit();
    // step.value = 0;
  }

  void remove() async {
    String res;

    res = await removecart(id.toString());

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      cartcontroller.initiate();
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
