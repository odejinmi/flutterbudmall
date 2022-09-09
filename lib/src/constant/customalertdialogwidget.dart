import 'package:flutter/material.dart';

class Customalertdialogwidget extends StatelessWidget {
  final Widget message;
  const Customalertdialogwidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: message,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

CustomAlertDialogwidgetloader({
  required BuildContext context,
  required Widget message,
}) {
  var dialog = Customalertdialogwidget(
    message: message,
  );
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => dialog);
}
