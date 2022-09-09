import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/cart.dart';
import '../controller/cartcontroller.dart';

class Cartcount extends StatelessWidget {
  Cartcount({Key? key}) : super(key: key);

  var cartcontroller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetX<Cartcontroller>(builder: (controller) {
        return Container(
          width: 73,
          height: 29,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20)),
              color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(
                package: 'flutterbudmall',
                "assests/images/cart.png",
                height: 15.47,
                width: 16.75,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(controller.originList.length.toString())
            ],
          ),
        );
      }),
      onTap: () {
        Get.to(() => Cart());
      },
    );
  }
}
