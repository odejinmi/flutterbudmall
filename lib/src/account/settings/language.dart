import 'package:flutter/material.dart';

import '../../constant/costumeAppbar.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Language",
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
              child: item("English", 0),
              onTap: () {
                setState(() {
                  selected = 0;
                });
              },
            ),
            GestureDetector(
              child: item("Vietnamese", 1),
              onTap: () {
                setState(() {
                  selected = 1;
                });
              },
            ),
            GestureDetector(
              child: item("Spanish", 2),
              onTap: () {
                setState(() {
                  selected = 2;
                });
              },
            ),
            GestureDetector(
              child: item("Russian", 3),
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
