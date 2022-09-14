import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/searchedittext.dart';
import 'cartcount.dart';
import 'dashboarditem.dart';
import 'filter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: primarycolour,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Image.asset(
                            package: 'flutterbudmall',
                            "assests/images/backicon1.png",
                            height: 36,
                            width: 36,
                          ),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Spacer(),
                        Image.asset(
                          package: 'flutterbudmall',
                          "assests/images/budmall.png",
                          height: 40,
                          width: 107,
                        ),
                        const Spacer(),
                        Cartcount()
                      ],
                    ),
                  ),
                  const SizedBox(),
                  Row(
                    children: [
                      Expanded(child: Searchedittext()),
                      const Filter(),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Dashboarditem(),
          ],
        ),
      ),
    );
  }
}
