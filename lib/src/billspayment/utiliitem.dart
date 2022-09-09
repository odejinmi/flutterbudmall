import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../controller/utilitycontroller.dart';
import 'utility.dart';
import 'utilitymore.dart';

class Utiliitem extends StatefulWidget {
  const Utiliitem({Key? key}) : super(key: key);

  @override
  _UtiliitemState createState() => _UtiliitemState();
}

class _UtiliitemState extends State<Utiliitem> {
  var utilitycontroller = Get.put(Utilitycontroller());

  @override
  Widget build(BuildContext context) {
    return GetX<Utilitycontroller>(builder: (controller) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Utility",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            controller.isLoading.isTrue
                ? loadingWidget2
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < 4; i++)
                        GestureDetector(
                          child: controller
                              .item(controller.buydataperser.value[i]),
                          onTap: () {
                            controller.selectedplan.value =
                                controller.buydataperser.value[i].billercode;
                            Get.to(() => Utility(
                                network:
                                    controller.buydataperser.value[i].name));
                          },
                        ),
                    ],
                  ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Row(
                children: const [
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              onTap: () {
                Get.to(() => Utilitymore());
              },
            ),
          ],
        ),
      );
    });
  }
}
