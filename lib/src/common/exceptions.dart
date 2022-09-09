import 'my_strings.dart';

class BudmallException implements Exception {
  String? message;

  BudmallException(this.message);

  @override
  String toString() {
    if (message == null) return Strings.unKnownError;
    return message!;
  }
}

class AuthenticationException extends BudmallException {
  AuthenticationException(String message) : super(message);
}

class CardException extends BudmallException {
  CardException(String message) : super(message);
}

class ChargeException extends BudmallException {
  ChargeException(String? message) : super(message);
}

class InvalidAmountException extends BudmallException {
  int amount = 0;

  InvalidAmountException(this.amount)
      : super('$amount is not a valid '
            'amount. only positive non-zero values are allowed.');
}

class InvalidEmailException extends BudmallException {
  String? email;

  InvalidEmailException(this.email) : super('$email  is not a valid email');
}

class BudmallSdkNotInitializedException extends BudmallException {
  BudmallSdkNotInitializedException(String message) : super(message);
}

class ProcessingException extends ChargeException {
  ProcessingException()
      : super(
            'A transaction is currently processing, please wait till it concludes before attempting a  charge.');
}
