import 'package:flutter/material.dart';
import 'package:flutterbudmall/src/Dashboard/bottomnavigation.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../controller/walletcontroller.dart';

class Wallet extends StatelessWidget {
  Wallet({Key? key}) : super(key: key);
  final walletcontroller = Get.put(Walletcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Wallet",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: GetX<Walletcontroller>(builder: (controller) {
        return Container(
          child: Column(
            children: [
              Container(
                height: 142,
                decoration: const BoxDecoration(
                    color: Color(0xffFFF2C7),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Balance"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "$Naira ${controller.visible.isTrue ? balance.value : '*****'}",
                          style: const TextStyle(fontSize: 28),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: const Icon(Icons.visibility),
                          onTap: () {
                            controller.visible.value =
                                !controller.visible.value;
                          },
                        ),
                        const Spacer(),
                        Container(
                          height: 30,
                          width: 76,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                              Text(
                                "USD",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Text(
                      "Money History",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "View All",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // item(),
              const SizedBox(
                height: 10,
              ),
              // item(),
              const Spacer(),
              Container(
                height: 71,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffFFF2C7)),
                child: const Text(
                  "Top Up",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffE9B200)),
                ),
              )
            ],
          ),
        );
      }),
      bottomNavigationBar: const Bottomnavigation(position: 2),
    );
  }

  Widget item() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          const Text(
            "15 February 2020",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Image.asset(
            package: 'flutterbudmall',
            "assests/images/cornflakes.png",
            width: 36.73,
            height: 37.29,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              const Text(
                "Nasco Corn..",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffB8B8B8)),
              ),
              Text(
                "$Naira 47.34",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.arrow_forward_ios,
              size: 14, color: Color(0xffB8B8B8))
        ],
      ),
    );
  }
}
