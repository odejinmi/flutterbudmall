import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Dashboard/bottomnavigation.dart';
import '../constant/constant.dart';
import 'Myorder/myorder.dart';
import 'accountinformation.dart';
import 'deliveryaddress.dart';
import 'paymentmethod.dart';
import 'settings/settings.dart';

class Accountprofile extends StatelessWidget {
  const Accountprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 206,
                color: primarycolour,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          package: 'flutterbudmall',
                          "assests/images/profilepics.png",
                          height: 77.86,
                          width: 77.86,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${firstname} ${lastname}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          child: Image.asset(
                            package: 'flutterbudmall',
                            "assests/images/profileback.png",
                            height: 28.55,
                            width: 28.55,
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 70,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Item("Account Information"),
                onTap: () {
                  Get.to(() => const Accountinformation());
                },
              ),
              GestureDetector(
                child: Item("My Order"),
                onTap: () {
                  Get.to(() => Myorder());
                },
              ),
              GestureDetector(
                child: Item("Payment Method"),
                onTap: () {
                  Get.to(() => const Paymentmethod());
                },
              ),
              GestureDetector(
                child: Item("Delivery Address"),
                onTap: () {
                  Get.to(() => const Deliveryaddress());
                },
              ),
              GestureDetector(
                child: Item("Settings"),
                onTap: () {
                  Get.to(() => const Settings());
                },
              ),
              Item("Contact with Us"),
              Item("About Us"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Bottomnavigation(position: 4),
    );
  }

  Widget Item(name) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                package: 'flutterbudmall',
                "assests/images/${name.replaceAll(" ", "").toLowerCase()}.png",
                width: 40.04,
                height: 40.04,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(name),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
