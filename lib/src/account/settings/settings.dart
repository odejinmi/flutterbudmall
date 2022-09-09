import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../constant/costumeAppbar.dart';
import 'currency.dart';
import 'language.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: const [
                Text("Shop In"),
                Spacer(),
                Text(
                  "Nigeria",
                  style: TextStyle(color: Color(0xff8992A3), fontSize: 15),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 14, color: Color(0xff8992A3))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Row(
                children: [
                  const Text("Currency"),
                  const Spacer(),
                  Text(
                    "$Naira Dollar",
                    style:
                        const TextStyle(color: Color(0xff8992A3), fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.arrow_forward_ios,
                      size: 14, color: Color(0xff8992A3))
                ],
              ),
              onTap: () {
                Get.to(() => const Currency());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Row(
                children: const [
                  Text("Language"),
                  Spacer(),
                  Text(
                    "English",
                    style: TextStyle(color: Color(0xff8992A3), fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 14, color: Color(0xff8992A3))
                ],
              ),
              onTap: () {
                Get.to(() => const Language());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text("Notifications"),
                Spacer(),
                Text(
                  "On",
                  style: TextStyle(color: Color(0xff8992A3), fontSize: 17),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 14, color: Color(0xff8992A3))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Terms & Conditions - Privacy Policy",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
