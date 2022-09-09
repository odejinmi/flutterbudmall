import 'package:flutter/material.dart';

import 'constant.dart';

class Nointernet extends StatefulWidget {
  const Nointernet({Key? key}) : super(key: key);

  @override
  _NointernetState createState() => _NointernetState();
}

class _NointernetState extends State<Nointernet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: primarycolour,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacer(),
          Image.asset(
            package: 'flutterbudmall',
            "assests/images/nointernet.png",
            height: 65,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Unable to connect to network",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
