import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/country.dart';
import '../constant/submitbutton.dart';
import '../controller/deliveryaddresscontroller.dart';

class Addnewdeliveryaddress extends StatelessWidget {
  Addnewdeliveryaddress({Key? key}) : super(key: key);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Your Country",
                style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Nigeria",
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
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                ),
                onTap: () async {
                  var tope = await Get.to(() => Country());
                  if (tope != null) {
                    controller.countryController.value.text = tope;
                  }
                },
                controller: controller.countryController.value,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
                  } else {}
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Address",
                style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Type your location",
                    // hintText: "Type your location or use pin",
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Color(edittextbodercolour)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Color(edittextbodercolour)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Color(edittextbodercolour)),
                    ),
                    suffixIcon: const Icon(Icons.location_on_outlined)),
                controller: controller.addressController.value,
                keyboardType: TextInputType.streetAddress,
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
                  } else {}
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Name of Consignee",
                style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Samuel Odejinmi",
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
                controller: controller.nameController.value,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  // widget.email(value);
                  if (value.isNotEmpty) {
                  } else {}
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Phone Number",
                style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "+234 812 68 000 068",
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
                  } else {}
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const Spacer(),
              Submitbutton(
                isloading: controller.isLoading.value,
                name: "Add new Address",
                processed: () {
                  controller.initiate(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      }),
    );
  }
}
