import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';
import 'encryptstring.dart';

SaveDetails(cmddetails, login) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (login) {
    token = cmddetails['data']['access_token'];
    prefs.setString('token', encrypt(cmddetails['data']['access_token']));
    // promoCode = cmddetails['data']['abit']['promoCode'];
    prefs.setString('referrallink', "");
  }

  // curRate = double.parse(cmddetails["data"]["settings"]["curRate"]);
  // tatprice = cmddetails["data"]["settings"]["tatprice"];
  // swapUrl = cmddetails["data"]["settings"]["swapURL"];
  // Square_Application_Id = cmddetails["data"]["settings"]["squareApplicationId"];
  // Square_Location = cmddetails["data"]["settings"]["squareLocation"];
  //
  // //getting abitID for shopper sake
  // abitID = cmddetails['data']['abit']['userID'];
  //
  // abitPin = cmddetails['data']['abit']['abitpin'] ?? '';

  //////
  // fullname = cmddetails['data']['user']['name'];
  // prefs.setString('fullname', encrypt(fullname));

  email = cmddetails['data']['user']['email'];
  prefs.setString('email', encrypt(email));
  firstname = cmddetails['data']['user']['firstname'];
  prefs.setString('firstname', encrypt(firstname));
  lastname = cmddetails['data']['user']['lastname'];
  prefs.setString('lastname', encrypt(lastname));
  username = cmddetails['data']['user']['username'];
  prefs.setString('username', encrypt(username));
  countrycode.value = cmddetails['data']['user']['country_code'];
  prefs.setString('country_code', encrypt(countrycode.value));
  phonenumber = cmddetails['data']['user']['mobile'];
  prefs.setString('phoneno', encrypt(phonenumber));

  /////////

  // country = cmddetails['data']['user']['nationality'];
  // prefs.setString('country', encrypt(country));

  // picture_url = cmddetails['data']['user']['picture_url'];
  // prefs.setString('picture_url', encrypt(picture_url));
  //
  // merchantkey = cmddetails['data']['user']['merchantkey'];
  // prefs.setString('merchantkey', encrypt(merchantkey));

  // member = cmddetails['data']['user']['member'];
  // prefs.setBool('member', member);
  //
  // cashtag = cmddetails['data']['user']['cashtag'] ?? " ";
  //
  // tfa = cmddetails['data']['user']['tfa'];
  // prefs.setBool('tfa', tfa);
  //
  // notification = cmddetails['data']['user']['notification'];
  // prefs.setBool('notification', notification);
  //
  // withdrawal_type = cmddetails['data']['user']['withdrawal_type'];
  // if (withdrawal_type != null) {
  //   prefs.setString('withdrawal_type', encrypt(withdrawal_type));
  // }
  //
  // PVIFTAT = cmddetails['data']['user']['PVIFTAT'];
  // member_created_at = cmddetails['data']['user']['member_created_at'];
  // withdrawal_secret2fa = cmddetails['data']['user']['withdrawal_secret2fa'];
  // withdrawal_code = cmddetails['data']['user']['withdrawal_secret2fa'];
  // Gcurrency = cmddetails['data']['user']['currency'];
}

getdetails() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  intro = prefs.getBool('intro') ?? false;
  // if (prefs.getBool('obscureBal') != null) {
  //   obscureBal = prefs.getBool('obscureBal');
  // }
  if (intro) {
    token = decrypt(prefs.getString('token') ?? "");
    firstname = decrypt(prefs.getString('firstname') ?? "");
    lastname = decrypt(prefs.getString('lastname') ?? "");
    email = decrypt(prefs.getString('email') ?? "");
    country.value = decrypt(prefs.getString('country') ?? "");
    // phoneno = decrypt(prefs.getString('phoneno')??"");
    // address = prefs.getString('address');
    // notification = prefs.getBool('notification');
    // tfa = prefs.getBool('tfa');
    // member = prefs.getBool('member');
    keeplogin = prefs.getBool('keeplogin') ?? false;
  }
}
