import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../billspayment/billspayment.dart';
import '../constant/constant.dart';
import '../constant/submitbutton.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Image.asset(
                package: 'flutterbudmall',
                "assests/images/closemenu.png",
                height: 30.85,
                width: 30.85,
              ),
              onTap: () {
                Get.back();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Samueljinmi123",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Budmall customer since",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 9),
            ),
            const Text(
              "Febuary 2022",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 9),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Pay your bills",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffD5F0DD)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bill payment",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "pay all your bill with a click",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 84,
                          decoration: const BoxDecoration(
                              color: Color(0xff35CE63),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: const Text(
                            "View",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        onTap: () {
                          Get.to(() => const Billspayment());
                        },
                      )
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    package: 'flutterbudmall',
                    "assests/images/tvbill.png",
                    height: 79,
                    width: 79,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Checkout what's new on Budmall",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Row(
                children: [
                  Image.asset(
                    package: 'flutterbudmall',
                    "assests/images/emailmarketing.png",
                    height: 117,
                    width: 117,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    package: 'flutterbudmall',
                    "assests/images/sale.png",
                    height: 117,
                    width: 117,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    package: 'flutterbudmall',
                    "assests/images/discount.png",
                    height: 117,
                    width: 117,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "$Naira ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 25),
                ),
                Text(
                  "Invite friends, get ${Naira}20",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 84,
                  decoration: const BoxDecoration(
                      color: primarycolour,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "Invite",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
            const Spacer(),
            Submitbutton(
              name: "Logout",
              buttoncolor: const Color(0xffE9E9E9),
              textcolor: Colors.black,
              processed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
