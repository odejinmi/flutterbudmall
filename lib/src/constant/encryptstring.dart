import 'package:encrypt/encrypt.dart';

String encrypt(plainText) {
  final key = Key.fromUtf8('orietidarukeysecret218b9d6c3cbe6');
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  var encrypted = encrypter.encrypt(plainText, iv: iv);
  return encrypted.base64; // R4Pxi
}

String decrypt(plainText) {
  final key = Key.fromUtf8('orietidarukeysecret218b9d6c3cbe6');
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  final decrypted = encrypter.decrypt64(plainText, iv: iv);

  return decrypted; //
}
