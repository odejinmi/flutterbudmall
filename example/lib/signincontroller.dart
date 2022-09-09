import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:konn3ct/constant/SaveGetdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../request/apis.dart';
import 'constant.dart';
import 'main.dart';

class Signincontroller extends GetxController {
  var isLoading = false.obs;
  var remember_me = false.obs;
  var filled = false.obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var formKey = GlobalKey<FormState>().obs;
  var passfield = false.obs;

  var authorized = 'Not Authorized'.obs;
  var isAuthenticating = false.obs;
  var plugin;

  bool supportsAppleSignIn = false;
// this bool will be true if apple sign in is enabled

  void initiate(context) async {
    String res;

    isLoading.value = true;
    var jsonBody = {
      "username": emailController.value.text.replaceAll(" ", ""),
      "password": passwordController.value.text.replaceAll(" ", ""),
    };

    res = await authAccount(jsonBody);

    isLoading.value = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      token = cmddetails["data"]['access_token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // SaveDetails(cmddetails, remember_me.value);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(
              title: 'fetchcountries',
            ),
          ));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();

    // if (Platform.isIOS) {
    //   supportsAppleSignIn = await AppleSignIn.isAvailable();
    // }
  }
}
