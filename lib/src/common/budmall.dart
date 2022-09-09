import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbudmall/src/Dashboard/dashboard.dart';
import 'package:flutterbudmall/src/common/custom_dialog.dart';
import 'package:flutterbudmall/src/constant/constant.dart';

import '../models/charge.dart';
import '../models/checkout_response.dart';
import 'exceptions.dart';
import 'string_utils.dart';
import 'utils.dart';

class Budmall {
  bool _sdkInitialized = false;
  String _publicKey = "";
  String _secretKey = "";
  // static late PlatformInfo platformInfo;

  /// Initialize the Budmall object. It should be called as early as possible
  /// (preferably in initState() of the Widget.
  ///
  /// [publicKey] - your Budmall public key. This is mandatory
  /// [secretKey] - your Budmall public key. This is mandatory
  ///
  /// use [checkout] and you want this plugin to initialize the transaction for you.
  /// Please check [checkout] for more information
  ///
  initialize(
      {required String publicKey,
      required String secretKey,
      required String tokened}) async {
    assert(() {
      if (publicKey.isEmpty) {
        throw BudmallException('publicKey cannot be null or empty');
      } else if (!publicKey.startsWith("pk_")) {
        throw BudmallException(Utils.getKeyErrorMsg('public'));
      } else if (secretKey.isEmpty) {
        throw BudmallException('secretKey cannot be null or empty');
      } else if (!secretKey.startsWith("sk_")) {
        throw BudmallException(Utils.getKeyErrorMsg('secret'));
      } else if (tokened.isEmpty) {
        throw BudmallException('token cannot be null or empty');
      } else
        return true;
    }());

    if (sdkInitialized) return;

    publicKey = publicKey;
    secretKey = secretKey;

    // Using cascade notation to build the platform specific info
    try {
      // platformInfo = (await PlatformInfo.getinfo())!;
      _publicKey = publicKey;
      _secretKey = secretKey;
      token = tokened;
      _sdkInitialized = true;
    } on PlatformException {
      rethrow;
    }
  }

  dispose() {
    _publicKey = "";
    _secretKey = "";
    _sdkInitialized = false;
  }

  bool get sdkInitialized => _sdkInitialized;

  String get publicKey {
    // Validate that the sdk has been initialized
    _validateSdkInitialized();
    return _publicKey;
  }

  String get secretKey {
    // Validate that the sdk has been initialized
    _validateSdkInitialized();
    return _secretKey;
  }

  void _performChecks() {
    //validate that sdk has been initialized
    _validateSdkInitialized();
    //check for null value, and length and starts with sk_
    if (_publicKey.isEmpty || !_publicKey.startsWith("pk_")) {
      throw AuthenticationException(Utils.getKeyErrorMsg('public'));
    } else if (_secretKey.isEmpty || !_secretKey.startsWith("sk_")) {
      throw AuthenticationException(Utils.getKeyErrorMsg('secret'));
    }
  }

  /// Make payment using Budmall's checkout form. The plugin will handle the whole
  /// processes involved.
  ///
  /// [context] - the widget's BuildContext
  ///
  /// [charge] - the charge object.
  ///
  /// [method] - The payment method to use(card, bank). It defaults to
  /// [CheckoutMethod.selectable] to allow the user to select. For [CheckoutMethod.bank]
  ///  or [CheckoutMethod.selectable], it is
  /// required that you supply an access code to the [Charge] object passed to [charge].
  /// For [CheckoutMethod.card], though not recommended, passing a reference to the
  /// [Charge] object will do just fine.
  ///
  /// Notes:
  ///
  /// * You can also pass the [PaymentCard] object and we'll use it to prepopulate the
  /// card  fields if card payment is being used
  ///
  /// [fullscreen] - Whether to display the payment in a full screen dialog or not
  ///
  /// [logo] - The widget to display at the top left of the payment prompt.
  /// Defaults to an Image widget with Budmall's logo.
  ///
  /// [hideEmail] - Whether to hide the email from the user. When
  /// `false` and an email is passed to the [charge] object, the email
  /// will be displayed at the top right edge of the UI prompt. Defaults to
  /// `false`
  ///
  /// [hideAmount]  - Whether to hide the amount from the  payment prompt.
  /// When `false` the payment amount and currency is displayed at the
  /// top of payment prompt, just under the email. Also the payment
  /// call-to-action will display the amount, otherwise it will display
  /// "Continue". Defaults to `false`
  Future<CheckoutResponse> checkout(BuildContext context) async {
    _performChecks();
    return _Budmall(publicKey, secretKey).checkout(context
        // charge: charge,
        // logo: logo,
        );
  }

  _validateSdkInitialized() {
    if (!sdkInitialized) {
      throw BudmallSdkNotInitializedException(
          'Budmall SDK has not been initialized. The SDK has'
          ' to be initialized before use');
    }
  }
}

class _Budmall {
  final String publicKey;
  final String secretKey;

  _Budmall(this.publicKey, this.secretKey);

  Future<CheckoutResponse> checkout(BuildContext context
      // {
      // required Charge charge,
      // Widget? logo,
      // }
      ) async {
    // assert(() {
    //   _validateChargeAndKey(charge);
    //   return true;
    // }());
    // final platform = platforminfo.Platform.instance.operatingSystem;
    // print(platform);
    CheckoutResponse? response = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          const CustomDialog(expanded: false, child: Dashboard()),
    );
    //  CheckoutResponse? response = await showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (BuildContext context) =>
    //       const CustomDialog(expanded: true, child: Dashboard()),
    // );
    return response!;
  }

  _validateChargeAndKey(Charge charge) {
    if (charge.amount.isNegative) {
      throw InvalidAmountException(charge.amount);
    }
    if (!StringUtils.isValidEmail(charge.email)) {
      throw InvalidEmailException(charge.email);
    }
  }
}
