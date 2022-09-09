import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/costumeAppbar.dart';
import '../controller/utilitycontroller.dart';
import 'utility.dart';

class Utilitymore extends StatelessWidget {
  var utilitycontroller = Get.put(Utilitycontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Bill payment",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetX<Utilitycontroller>(builder: (controller) {
        return Container(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Wrap(
                children: [
                  for (int i = 0; i < controller.buydataperser.length; i++)
                    GestureDetector(
                      child: controller.item(controller.buydataperser.value[i]),
                      onTap: () {
                        controller.selectedplan.value =
                            controller.buydataperser.value[i].billercode;
                        Get.to(() => Utility(
                            network: controller.buydataperser.value[i].name));
                      },
                    ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     GestureDetector(
              //       child: item("IBADAN"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "IBADAN"));
              //       },
              //     ),
              //     GestureDetector(
              //       child: item("EKO"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "EKO"));
              //       },
              //     ),
              //     GestureDetector(
              //       child: item("IKEJA"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "IKEJA"));
              //       },
              //     ),
              //     GestureDetector(
              //       child: item("ENUGU"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "IBADAN"));
              //       },
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 20,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     GestureDetector(
              //         child: item("ABUJA"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "ABUJA"));
              //       },
              //     ),
              //     GestureDetector(
              //         child: item("JOS"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "JOS"));
              //       },
              //     ),
              //     GestureDetector(
              //         child: item("KANO"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "Kano"));
              //       },
              //     ),
              //     GestureDetector(
              //         child: item("KADUNA"),
              //       onTap: (){
              //         Get.to(()=>const Utility(network: "KADUNA"));
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        );
      }),
    );
  }
}
