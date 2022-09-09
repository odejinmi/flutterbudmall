import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../constant/nointernet.dart';
import 'env_variable.dart';

var onFailure = '{"success":false,"message":"No internet connection"}';

Future<String> getApiCall(endpoint) async {
  var res = onFailure;

  try {
    http.Response response = await http.get(parseURL(endpoint), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    });

    res = response.body;
    if (debug) {
      print(res);
    }
  } catch (Exception) {
    Get.bottomSheet(Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              height: 500,
              child: Nointernet(),
            ))));

    if (debug) {
      print(Exception);
    }
  }
  return res;
}

Future<String> getApiCallTokenized(endpoint, {bool notchat = true}) async {
  var res = onFailure;
  try {
    http.Response response = await http.get(parseURL(endpoint), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    });

    res = response.body;
    if (debug) {
      print("method: $res");
    }

    if (response.statusCode == 401 || response.statusCode == 403) {}
  } catch (Exception) {
    if (notchat) {
      Get.bottomSheet(Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                height: 500,
                child: Nointernet(),
              ))));
    }

    if (debug) {
      print(Exception);
    }
  }
  return res;
}

Future<String> postApiCall(jsonBody, endpoint) async {
  var res = onFailure;

  if (debug) {
    print(jsonBody);
  }

  try {
    http.Response response = await http.post(
      parseURL(endpoint),
      body: jsonBody,
    );

    res = response.body;
    if (debug) {
      print("method: $res");
    }
  } catch (Exception) {
    Get.bottomSheet(Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              height: 500,
              child: Nointernet(),
            ))));

    if (debug) {
      print(Exception);
    }
  }
  return res;
}

Future<String> postApiCallTokenized(jsonBody, endpoint,
    {bool notchat = true}) async {
  var res = onFailure;

  if (debug) {
    print(jsonBody);
  }

  try {
    http.Response response = await http.post(
      parseURL(endpoint),
      body: jsonBody,
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    res = response.body;
    if (debug) {
      print("method: $res");
    }
    if (response.statusCode == 401 || response.statusCode == 403) {}
  } catch (e) {
    if (notchat) {
      Get.bottomSheet(Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                height: 500,
                child: Nointernet(),
              ))));
    }

    if (debug) {
      print("error");
      print(e);
    }
  }
  return res;
}

Future<String> deleteApiCallTokenized(endpoint, {bool notchat = true}) async {
  var res = onFailure;

  try {
    http.Response response = await http.delete(
      parseURL(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    res = response.body;
    if (debug) {
      print("method: $res");
    }
    if (response.statusCode == 401 || response.statusCode == 403) {}
  } catch (e) {
    if (notchat) {
      Get.bottomSheet(Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                height: 500,
                child: Nointernet(),
              ))));
    }

    if (debug) {
      print(Exception);
    }
  }
  return res;
}
// uploadimage('image', File('assets/testimage.png'));
// uploadimage(String title, String type, String file) async {
//   var request = http.MultipartRequest("POST", parseURL("app/chat"),);
//   // request.fields['id'] = "${chartid}";
//   Map<String, String> json_body = {
//     "id": "${chartid}",
//     "type": type
//     // "type": messagetype.value
//   };
//   request.fields.addAll(json_body);
//   // //single headers
//   // request.headers['Authorization'] = "";
//   //multiple headers
//   Map<String, String> headers = {HttpHeaders.authorizationHeader: "Bearer $token",};
//   request.headers.addAll(headers);
//
//   var picture = http.MultipartFile.fromBytes(type, File(file).readAsBytesSync(),
//   filename: title);
//
//   request.files.add(picture);
//   var response = await request.send();
//   var responData = await response.stream.toBytes();
//   var result = String.fromCharCodes(responData);
//   print(result);
// }
