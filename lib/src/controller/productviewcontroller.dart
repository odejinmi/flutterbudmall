import 'dart:convert';

import 'package:get/get.dart';

import '../cart/cart.dart';
import '../model/productDetails.dart';
import '../request/apis.dart';
import 'itemcountercontroller.dart';

class Productviewcontroller extends GetxController {
  var isLoading = false.obs;
  var nDatalist;
  var fullProductDetails;
  var itemcountercontroller = Get.put(Itemcountercontroller());
  @override
  void onInit() {
    super.onInit();
  }

  void add() async {
    String res;

    isLoading.value = true;
    var jsonBody = {
      "product_id": nDatalist.id.toString(),
      "quantity": itemcountercontroller.count.value.toString()
    };
    res = await addcart(jsonBody);

    var cmddetails = jsonDecode(res);

    isLoading.value = false;

    if (cmddetails['status']) {
      Get.to(() => const Cart());
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  void productDetails() async {
    String res;

    try {
      isLoading.value = true;
    } catch (Exception) {
      print("an error occured when saving");
    }

    print("nDatalist.id");
    print(nDatalist.id);

    res = await productDetail(nDatalist.id);

    var cmddetails = jsonDecode(res);

    isLoading.value = false;

    if (cmddetails['status']) {
      fullProductDetails =
          productDetailsParseFromJson(json.encode(cmddetails['data']));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
