import 'package:flutter/material.dart';

import '../../constant/costumeAppbar.dart';

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Currency",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: item("€ EUR", 0),
              onTap: () {
                setState(() {
                  selected = 0;
                });
              },
            ),
            GestureDetector(
              child: item("\$ USD", 1),
              onTap: () {
                setState(() {
                  selected = 1;
                });
              },
            ),
            GestureDetector(
              child: item("Đ VND", 2),
              onTap: () {
                setState(() {
                  selected = 2;
                });
              },
            ),
            GestureDetector(
              child: item("AU\$ AUD", 3),
              onTap: () {
                setState(() {
                  selected = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget item(name, position) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Visibility(
              visible: position == selected,
              child: Image.asset(
                package: 'flutterbudmall',
                "assests/images/marked.png",
                width: 14.9,
                height: 11.32,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}
