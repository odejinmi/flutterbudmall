import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/searchedittext.dart';
import 'bottomnavigation.dart';
import 'cartcount.dart';
import 'dashboarditem.dart';
import 'filter.dart';
import 'menu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primarycolour,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Image.asset(
                            package: 'flutterbudmall',
                            "assests/images/menu.png",
                            height: 36,
                            width: 36,
                          ),
                          onTap: () {
                            Get.to(() => const Menu());
                          },
                        ),
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
      bottomNavigationBar: const Bottomnavigation(position: 1),
    );
  }
}
