import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  final int position, selected;
  const Check({Key? key, required this.selected, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      package: 'flutterbudmall',
      "assests/images/${position == selected ? 'check' : 'uncheck'}.png",
      height: 20.16,
      width: 20.16,
    );
  }
}
