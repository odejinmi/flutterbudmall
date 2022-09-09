import 'dart:convert';

import '../common/exceptions.dart';
import '../common/my_strings.dart';
import 'bank.dart';

class Charge {
  // PaymentCard? card;

  /// The email of the customer
  String? email;
  BankAccount? _account;

  /// Amount to pay in base currency. Must be a valid positive number
  int amount = 0;
  Map<String, dynamic>? _metadata;
  List<Map<String, dynamic>>? _customFields;
  bool _hasMeta = false;
  Map<String, String?>? _additionalParameters;

  /// The locale used for formatting amount in the UI prompt. Defaults to [Strings.nigerianLocale]
  String? locale;
  String? accessCode;
  String? plan;
  String? _reference;

  /// ISO 4217 payment currency code (e.g USD). Defaults to [Strings.ngn].
  ///
  /// If you're setting this value, also set [locale] for better formatting.
  String? currency;
  int? transactionCharge;

  /// Who bears Budmall charges? [Bearer.account] or [Bearer.subAccount]
  Bearer? bearer;

  String? subAccount;

  Charge() {
    _metadata = {};
    amount = -1;
    _additionalParameters = {};
    _customFields = [];
    _metadata!['custom_fields'] = _customFields;
    locale = Strings.nigerianLocale;
    currency = Strings.ngn;
  }

  addParameter(String key, String value) {
    _additionalParameters![key] = value;
  }

  Map<String, String?>? get additionalParameters => _additionalParameters;

  BankAccount? get account => _account;
  String? get reference => _reference;

  set account(BankAccount? value) {
    if (value == null) {
      // Precaution to avoid setting of this field outside the library
      throw BudmallException('account cannot be null');
    }
    _account = value;
  }

  set reference(String? value) {
    if (value == null) {
      // Precaution to avoid setting of this field outside the library
      throw BudmallException('reference cannot be null');
    } else if (value.length < 16) {
      // Precaution to avoid setting of this field outside the library
      throw BudmallException('reference should be atleast 16 digit');
    }
    _reference = value;
  }

  putMetaData(String name, dynamic value) {
    _metadata![name] = value;
    _hasMeta = true;
  }

  putCustomField(String displayName, String value) {
    var customMap = {
      'value': value,
      'display_name': displayName,
      'variable_name':
          displayName.toLowerCase().replaceAll(RegExp(r'[^a-z0-9 ]'), "_")
    };
    _customFields!.add(customMap);
    _hasMeta = true;
  }

  String? get metadata {
    if (!_hasMeta) {
      return null;
    }

    return jsonEncode(_metadata);
  }
}

enum Bearer {
  account,
  subAccount,
}
