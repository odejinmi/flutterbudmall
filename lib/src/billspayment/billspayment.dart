import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/costumeAppbar.dart';
import 'airtimedata.dart';
import 'cabletv.dart';
import 'utiliitem.dart';

class Billspayment extends StatelessWidget {
  const Billspayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Bill payment",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Airtime/Data",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: item("GLO"),
                  onTap: () {
                    Get.to(() => const Airtimedata(network: "Glo"));
                  },
                ),
                GestureDetector(
                  child: item("MTN"),
                  onTap: () {
                    Get.to(() => const Airtimedata(network: "Mtn"));
                  },
                ),
                GestureDetector(
                  child: item("AIRTEL"),
                  onTap: () {
                    Get.to(() => const Airtimedata(network: "Airtel"));
                  },
                ),
                GestureDetector(
                  child: item("9MOBILE"),
                  onTap: () {
                    Get.to(() => const Airtimedata(network: "9mobile"));
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Spacer(),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Cable Tv",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: item("DSTV"),
                  onTap: () {
                    Get.to(() => const Cabletv(network: "DSTV"));
                  },
                ),
                GestureDetector(
                  child: item("GOTV"),
                  onTap: () {
                    Get.to(() => const Cabletv(network: "GOTV"));
                  },
                ),
                GestureDetector(
                  child: item("STARTIMES"),
                  onTap: () {
                    Get.to(() => const Cabletv(network: "STATIMES"));
                  },
                ),
                GestureDetector(
                  child: item("IROKOTV"),
                  onTap: () {
                    Get.to(() => const Cabletv(network: "IROKOTV"));
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Spacer(),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Utiliitem()
          ],
        ),
      ),
    );
  }

  Widget item(name) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            package: 'flutterbudmall',
            "assests/images/${name.toLowerCase()}.png",
            height: 53,
            width: 53,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
