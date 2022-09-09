import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../controller/cartcontroller.dart';
import '../controller/itemcountercontroller.dart';
import '../controller/productviewcontroller.dart';
import '../request/apis.dart';

class Itemcounter extends StatefulWidget {
  var available, cart, id;
  Itemcounter({Key? key, this.available, this.cart = false, this.id})
      : super(key: key);

  @override
  _ItemcounterState createState() => _ItemcounterState();
}

class _ItemcounterState extends State<Itemcounter> {
  var productviewcontroller = Get.put(Productviewcontroller());
  int count = 1;

  var cartcontroller = Get.put(Cartcontroller());

  void remove() async {
    String res;

    res = await removecart(widget.id.toString());

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      cartcontroller.initiate();
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEDF1F7)),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.center,
              child: const Text("-"),
            ),
            onTap: () {
              if (count > 1) {
                setState(() {
                  count -= 1;
                });
              } else if (widget.cart) {
                remove();
              }
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "$count",
            style: const TextStyle(fontSize: 17, color: primarycolour),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEDF1F7)),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.center,
              child: const Text("+"),
            ),
            onTap: () {
              if (count < int.parse(widget.available)) {
                setState(() {
                  count += 1;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
