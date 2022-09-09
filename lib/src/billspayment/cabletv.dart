import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';
import '../controller/cabletvcontroller.dart';

class Cabletv extends StatefulWidget {
  final String network;
  const Cabletv({Key? key, required this.network}) : super(key: key);

  @override
  _CabletvState createState() => _CabletvState();
}

class _CabletvState extends State<Cabletv> {
  var cabletvcontroller = Get.put(Cabletvcontroller());

  @override
  Widget build(BuildContext context) {
    cabletvcontroller.network.value = widget.network;
    return Scaffold(
      appBar: CostumeAppbar(
        name: Text(
          widget.network,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: GetX<Cabletvcontroller>(builder: (controller) {
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
                  hintText: "Smart card number",
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
                    if (controller.type.value != "Box Office") {
                      controller.initiate(context);
                    }
                  }
                },
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
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
                                    controller.buydataperser.value[i].name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      controller.type.value = controller
                                          .buydataperser.value[i].name;
                                      controller.selectedplan.value = controller
                                          .buydataperser.value[i].plan;
                                      controller.amountController.value.text =
                                          controller
                                              .buydataperser.value[i].cost;
                                      if (controller.iucController.value.text
                                          .isNotEmpty) {
                                        controller.initiate(context);
                                      }
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
              TextFormField(
                readOnly: true,
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
              const Text("Processing fee:  ₦100.00"),
              const Spacer(),
              Submitbutton(
                isloading: controller.isLoading.value,
                name: "Pay",
                processed: () {
                  if (controller.iucController.value.text.isNotEmpty &&
                      controller.type.value != "Box Office") {
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
