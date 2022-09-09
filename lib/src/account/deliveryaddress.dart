import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';
import '../controller/deliveryaddresscontroller.dart';
import 'Myorder/addresswidget.dart';
import 'addnewdeliveryaddress.dart';

class Deliveryaddress extends StatefulWidget {
  const Deliveryaddress({Key? key}) : super(key: key);

  @override
  _DeliveryaddressState createState() => _DeliveryaddressState();
}

class _DeliveryaddressState extends State<Deliveryaddress> {
  final deliveryaddresscontroller = Get.put(Deliveryaddresscontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Delivery Address",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: GetX<Deliveryaddresscontroller>(builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              controller.isLoading.value ? loadingWidget2 : Container(),
              for (int i = 0; i < controller.buydataperser.value.length; i++)
                item(controller.buydataperser.value[i]),
              const Spacer(),
              Submitbutton(
                isloading: controller.isLoading.value,
                name: "Add new Address",
                processed: () {
                  Get.to(() => Addnewdeliveryaddress());
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget item(value) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xffEDF1F7))),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [Text("Address 1"), Spacer(), Text("...")],
          ),
          const SizedBox(
            height: 10,
          ),
          Addresswidget(
            nDatalist: value,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
