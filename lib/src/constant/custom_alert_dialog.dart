import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final String message;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final Function? onPostivePressed;
  final Function? onNegativePressed;
  final double? circularBorderRadius;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPostivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius!)),
      actions: <Widget>[
        Visibility(
          visible: negativeBtnText != null ? true : false,
          child: ElevatedButton(
            style: ButtonStyle(
                // textStyle: Theme.of(context).colorScheme.secondary
                ),
            child: Text(negativeBtnText ?? ""),
            // textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Navigator.of(context).pop();
              if (onNegativePressed != null) {
                onNegativePressed!();
              }
            },
          ),
        ),
        Visibility(
          visible: positiveBtnText != null ? true : false,
          child: ElevatedButton(
            child: Text(
              positiveBtnText ?? "",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            style: ButtonStyle(
                // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                // backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //     RoundedRectangleBorder(
                //         borderRadius: BorderRadius.zero,
                //         side: BorderSide(color: Colors.red)))
                ),
            onPressed: () {
              if (onPostivePressed != null) {
                onPostivePressed!();
              }
            },
          ),
        ),
        ElevatedButton(
            child:
                Text("Buy now".toUpperCase(), style: TextStyle(fontSize: 14)),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.red)))),
            onPressed: () => null)
      ],
    );
  }
}

CustomAlertDialogloader(
    {required BuildContext context,
    required String title,
    required String message,
    bool disable = true,
    required String negativeBtnText,
    String? positiveBtnText,
    Function? onPostivePressed,
    required Function onNegativePressed}) {
  var dialog = CustomAlertDialog(
      title: title,
      message: message,
      onPostivePressed: onPostivePressed,
      positiveBtnText: positiveBtnText,
      onNegativePressed: onNegativePressed,
      negativeBtnText: negativeBtnText);
  showDialog(
      context: context,
      barrierDismissible: disable,
      builder: (BuildContext context) => dialog);
}
