import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// import 'package:abitpay/request/dynamicLink.dart';
// import 'package:age_calculator/age_calculator.dart';
import 'package:intl/intl.dart';
// import 'package:share_plus/share_plus.dart';

// //  primarycolour = Color(0xff347AF0);
// parseUrl(endpoint) {
//   return Uri.parse("${decrypt(Baseurl)}" + endpoint);
// }

const overrideVersion = "1.2.3";
int primarycolour1 = 0xff000080;
const primarycolour = Color(0xffE9B200);
const farmcolour = Color(0xff25C364);
const maincolour = Color(0xff070688);
const alternateColour = Color(0xffC6C6DF);
const disablecolor = Color(0xffF0F0FB);
const secondarycolor = Color(0xff7F7FAE);
const dangerFaintColor = Color(0xffFDE9EE);
const dangerColor = Color(0xffED2459);
int edittextbodercolour = 0xffABABCC;
int Grey900 = 0xff21214F;
int Grey500 = 0xff7F7FAE;
int Grey400 = 0xffABABCC;
int Grey600 = 0xff5A5A8B;
int Grey200 = 0xffDDDDEF;
int Grey100 = 0xffF0F0FB;
int Red600 = 0xffED2459;
int Red100 = 0xffFDE9EE;
// int scafoldcolour = 0xffEDF1F9;
int kTextColor = 0xFF757575;

// int kShrinePink50 = 0xFFFEEAE6;
// int kShrinePink100 = 0xFFFEDBD0;
int kShrineFrameBrown = 0x8A442C2E;
int kShrineScrim = 0x73442C2E;
// const Color kShrinePink50 = Color(0xFFFEEAE6);
// const Color kShrinePink100 = Color(0xFFFEDBD0);
// const Color kShrineFrameBrown = Color(0x8A442C2E);
// const Color kShrineScrim = Color(0x73442C2E);

const loadingWidget = SpinKitThreeBounce(
  color: Colors.white,
  size: 30.0,
);
const loadingWidget2 = SpinKitThreeBounce(
  color: Color(0xffE9B200),
  size: 30.0,
);
List originList = [
  {"name": "Food items", "color": "0xffE9B200"},
  {"name": "House Hold", "color": "0xff00C8C8"},
  {"name": "Beauty & care", "color": "0xffA49CF5"},
  {"name": "Drinks & Beverages", "color": "0xffFF755A"},
  {"name": "Baby products", "color": "0xff73C253"},
  {"name": "Special Offer", "color": "0xffF93F23"},
  {"name": "Phone & accessories", "color": "0xffA49CF5"},
  {"name": "Valentine Deals", "color": "0xffFDCD74"},
  {"name": "Electronics", "color": "0xffFFA217"},
  {"name": "Sporting/Heath", "color": "0xffD3F3C2"}
];
List bannerList = [];
String token = "";
var country = "".obs;
var countrycode = "".obs;
var balance = "0".obs;
String email = "";
String password = "";
String username = "";
String firstname = "";
String lastname = "";
String phonenumber = "";
String verifycode = "";
var mobile_code = "".obs;
bool intro = false;
bool keeplogin = false;
String Naira = "₦";
var defaultaddress;

final sammy = new NumberFormat("#,##0.00", "en_US");
