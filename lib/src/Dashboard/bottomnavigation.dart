import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Favourite/favourite.dart';
import '../Wallet/wallet.dart';
import '../account/accountprofile.dart';
import '../controller/cartcontroller.dart';
import '../controller/dashboardcontroller.dart';
import '../controller/walletcontroller.dart';
import 'dashboard.dart';

class Bottomnavigation extends StatelessWidget {
  final int position;
  const Bottomnavigation({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Image.asset(
              package: 'flutterbudmall',
              "assests/images/${position == 1 ? 'selectedhome' : 'home'}.png",
              height: 22.14,
              width: 21.22,
            ),
            onTap: () {
              if (position != 1) {
                Get.delete<Walletcontroller>();
                Get.to(() => const Dashboard());
              }
            },
          ),
          GestureDetector(
            child: Image.asset(
              package: 'flutterbudmall',
              "assests/images/${position == 2 ? 'selectedwallet' : 'wallet'}.png",
              height: 24.45,
              width: 26.48,
            ),
            onTap: () {
              Get.delete<Dashboardcontroller>();
              Get.delete<Cartcontroller>();
              Get.to(() => Wallet());
            },
          ),
          GestureDetector(
            child: Image.asset(
              package: 'flutterbudmall',
              "assests/images/${position == 3 ? 'checklove' : 'love'}.png",
              height: 24.68,
              width: 25.98,
            ),
            onTap: () {
              Get.delete<Walletcontroller>();
              Get.delete<Dashboardcontroller>();
              Get.delete<Cartcontroller>();
              Get.to(() => const Favourite());
            },
          ),
          GestureDetector(
            child: Image.asset(
              package: 'flutterbudmall',
              "assests/images/${position == 4 ? 'selectedprofile' : 'profile'}.png",
              height: 22.14,
              width: 16.6,
            ),
            onTap: () {
              if (position != 4) {
                Get.delete<Walletcontroller>();
                Get.delete<Dashboardcontroller>();
                Get.delete<Cartcontroller>();
                Get.to(() => const Accountprofile());
              }
            },
          ),
        ],
      ),
    );
  }
}
