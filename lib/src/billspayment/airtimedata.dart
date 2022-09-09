import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';
import '../controller/airtimedatacontroller.dart';

class Airtimedata extends StatefulWidget {
  final String network;
  const Airtimedata({Key? key, required this.network}) : super(key: key);

  @override
  _AirtimedataState createState() => _AirtimedataState();
}

class _AirtimedataState extends State<Airtimedata> {
  var airtimedatacontroller = Get.put(Airtimedatacontroller());

  @override
  Widget build(BuildContext context) {
    airtimedatacontroller.network.value = widget.network;
    return Scaffold(
      appBar: CostumeAppbar(
        name: Text(
          widget.network,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: GetX<Airtimedatacontroller>(builder: (controller) {
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
                  hintText: "Phone number",
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
                controller: controller.phoneController.value,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
                    setState(() {
                      // widget.emailfield(true);
                    });
                  } else {
                    setState(() {
                      // widget.emailfield(false);
                    });
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
                            "Data bundle",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            setState(() {
                              controller.type.value = "Data bundle";
                            });
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
                            "Mobile Top-up",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            setState(() {
                              controller.type.value = "Mobile Top-up";
                            });
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
              controller.type.value == "Data bundle"
                  ? GestureDetector(
                      child: Container(
                        height: 63,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border:
                                Border.all(color: Color(edittextbodercolour))),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              controller.plan.value,
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
                              border:
                                  Border.all(color: Color(edittextbodercolour)),
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i < controller.buydataperser.value.length;
                                    i++)
                                  Column(
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          controller
                                              .buydataperser.value[i].name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            controller.plan.value = controller
                                                .buydataperser.value[i].name;
                                            controller.selectedplan.value =
                                                controller.buydataperser
                                                    .value[i].plan;
                                          });
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
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ));
                      },
                    )
                  : TextFormField(
                      decoration: InputDecoration(
                        prefixText: "₦",
                        hintText: "Amount",
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Color(edittextbodercolour)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Color(edittextbodercolour)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Color(edittextbodercolour)),
                        ),
                      ),
                      controller: controller.amountController.value,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        // widget.email(value);
                        if (value.isNotEmpty) {
                          setState(() {
                            // widget.emailfield(true);
                          });
                        } else {
                          setState(() {
                            // widget.emailfield(false);
                          });
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
              const Text("Processing fee:  ₦10.00"),
              const Spacer(),
              Submitbutton(
                name: "Pay",
                isloading: controller.isLoading.value,
                processed: () {
                  controller.initiate(context);
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
