import 'package:flutterbudmall/src/account/Myorder/processing.dart';
import 'package:flutterbudmall/src/account/Myorder/shipped.dart';
import 'package:flutterbudmall/src/constant/constant.dart';
import 'package:flutterbudmall/src/constant/costumeAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ordercontroller.dart';

class Myorder extends StatefulWidget {
  final bool back;
  const Myorder({Key? key, this.back = true}) : super(key: key);

  @override
  _MyorderState createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  var cartcontroller = Get.put(Ordercontroller());
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        goback: widget.back,
        name: const Text(
          "My Order",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        child: GetX<Ordercontroller>(builder: (controller) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Processing",
                        style: TextStyle(
                            fontSize: 17,
                            color: selected == 1
                                ? primarycolour
                                : const Color(0xff8992A3)),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 1;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        "Shipped",
                        style: TextStyle(
                            fontSize: 17,
                            color: selected == 2
                                ? primarycolour
                                : const Color(0xff8992A3)),
                      ),
                      onTap: () {
                        setState(() {
                          selected = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: selected == 1
                          ? primarycolour
                          : const Color(0xff8992A3),
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: selected == 2
                          ? primarycolour
                          : const Color(0xff8992A3),
                      thickness: 1,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              controller.isLoading.value
                  ? loadingWidget2
                  : selected == 1
                      ? Expanded(
                          child: Processing(
                            originList: controller.originList,
                          ),
                        )
                      : Expanded(
                          child: Shipped(originList: controller.originList))
            ],
          );
        }),
      ),
    );
  }
}
