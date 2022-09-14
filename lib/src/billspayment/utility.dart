import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';
import '../controller/utilitycontroller.dart';

class Utility extends StatelessWidget {
  final String network;
  Utility({Key? key, required this.network}) : super(key: key);
  var utilitycontroller = Get.put(Utilitycontroller());

  @override
  Widget build(BuildContext context) {
    utilitycontroller.network.value = network;
    return Scaffold(
      appBar: CostumeAppbar(
        name: Text(
          network,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: GetX<Utilitycontroller>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Account ID / User ID",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                ),
                controller: controller.iucController.value,
                keyboardType: TextInputType.phone,
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    if (controller.type.value != "select plan" &&
                        controller.amountController.value.text.isNotEmpty) {
                      controller.initiate(context);
                    }
                  }
                },
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
                    // if (controller.type.value != "select plan" && controller.amountController.value.text.isNotEmpty) {
                    //   controller.initiate(context);
                    // }
                  } else {
                    // widget.emailfield(false);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Container(
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Color(edittextbodercolour))),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        controller.type.value,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down_sharp),
                    ],
                  ),
                ),
                onTap: () {
                  Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(edittextbodercolour)),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: const Text(
                            "Prepaid",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            controller.type.value = "Prepaid";
                            if (controller
                                    .iucController.value.text.isNotEmpty &&
                                controller
                                    .amountController.value.text.isNotEmpty) {
                              controller.initiate(context);
                            }
                            Get.back();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Postpaid",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            controller.type.value = "Postpaid";
                            if (controller
                                    .iucController.value.text.isNotEmpty &&
                                controller
                                    .amountController.value.text.isNotEmpty) {
                              controller.initiate(context);
                            }
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Customer Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                ),
                controller: controller.customername.value,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
                    // widget.emailfield(true);
                  } else {
                    // widget.emailfield(false);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixText: "₦",
                  hintText: "2,000.00",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(edittextbodercolour)),
                  ),
                ),
                controller: controller.amountController.value,
                keyboardType: TextInputType.phone,
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    if (controller.type.value != "select plan" &&
                        controller.iucController.value.text.isNotEmpty) {
                      controller.initiate(context);
                    }
                  }
                },
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
                  } else {
                    // widget.emailfield(false);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // const Text("Processing fee:  ₦100.00"),
              const Spacer(),
              Submitbutton(
                name: "Pay",
                isloading: controller.isLoading.value,
                processed: () {
                  if (controller.iucController.value.text.isNotEmpty &&
                      controller.amountController.value.text.isNotEmpty &&
                      controller.type.value != "select plan") {
                    controller.puycabletv(context);
                  }
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        );
      }),
    );
  }
}
