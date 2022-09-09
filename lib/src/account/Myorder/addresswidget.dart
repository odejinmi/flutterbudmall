import 'package:flutter/material.dart';

class Addresswidget extends StatelessWidget {
  var nDatalist;
  Addresswidget({Key? key, this.nDatalist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                package: 'flutterbudmall',
                "assests/images/location.png",
                height: 14.28,
                width: 12.68,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  nDatalist.address,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset(
                package: 'flutterbudmall',
                "assests/images/selectedprofile.png",
                height: 13.44,
                width: 11.84,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                nDatalist.name,
                style: const TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset(
                package: 'flutterbudmall',
                "assests/images/contact.png",
                height: 14.94,
                width: 13.34,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                nDatalist.phoneNumber,
                style: const TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
