import 'package:flutter/material.dart';
import 'package:flutterbudmall/src/account/Myorder/addresswidget.dart';
import 'package:flutterbudmall/src/account/deliveryaddress.dart';
import 'package:flutterbudmall/src/account/paymentmethod.dart';
import 'package:flutterbudmall/src/constant/constant.dart';
import 'package:flutterbudmall/src/constant/costumeAppbar.dart';
import 'package:flutterbudmall/src/constant/submitbutton.dart';
import 'package:get/get.dart';

import '../controller/cartcontroller.dart';
import '../controller/deliveryaddresscontroller.dart';
import 'check.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var cartcontroller = Get.put(Cartcontroller());
  final deliveryaddresscontroller = Get.put(Deliveryaddresscontroller());

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(""),
      ),
      body: GetX<Cartcontroller>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Delivery Address"),
                  const Spacer(),
                  GestureDetector(
                    child: const Text("Change"),
                    onTap: () {
                      Get.to(() => const Deliveryaddress());
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Addresswidget(
                nDatalist: deliveryaddresscontroller
                    .buydataperser.value[defaultaddress],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text("Order Bill"),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    "Product",
                    style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
                  ),
                  const Spacer(),
                  Text(
                    "${cartcontroller.originList.length} item(s)",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
                  ),
                  const Spacer(),
                  Text(
                    "${Naira}${cartcontroller.total}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    "Shipping Fee",
                    style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
                  ),
                  const Spacer(),
                  Text(
                    "${Naira}12.00",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    "Discount",
                    style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
                  ),
                  const Spacer(),
                  Text(
                    "-${Naira}0.00",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    "Total Bill",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${Naira} ${cartcontroller.totalwshipin}",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: const Text(
                      "Add new",
                      style: TextStyle(fontSize: 14, color: primarycolour),
                    ),
                    onTap: () {
                      Get.to(() => const Paymentmethod());
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 64.51,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: const Color(0xffEDF1F7)),
                ),
                child: Row(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Image.asset(
                          package: 'flutterbudmall',
                          "assests/images/selectedwallet.png",
                          height: 21.37,
                          width: 23.15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text.rich(TextSpan(children: [
                      const TextSpan(
                          text: "Wallet Bal: ",
                          style: TextStyle(
                              color: Color(0xffBFBFBF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: "$Naira $balance",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ])),
                    const Spacer(),
                    GestureDetector(
                      child: Check(selected: selected, position: 0),
                      onTap: () {
                        setState(() {
                          selected = 0;
                        });
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 64.51,
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(
              //     borderRadius: const BorderRadius.all(Radius.circular(20)),
              //     border: Border.all(color: const Color(0xffEDF1F7)),
              //   ),
              //   child: Row(
              //     children: [
              //       Card(
              //         elevation: 2,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //         ),
              //         child: Image.asset(
              // package: 'flutterbudmall',
              //           "assests/images/marstercard.png",
              //           height: 40.32,
              //           width: 60.48,
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       const Text("  ····  ····  ····   ·068",
              //           style: TextStyle(
              //               fontSize: 16, fontWeight: FontWeight.bold)),
              //       const Spacer(),
              //       GestureDetector(
              //         child: Check(selected: selected, position: 1),
              //         onTap: () {
              //           setState(() {
              //             selected = 1;
              //           });
              //         },
              //       )
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Submitbutton(
                name: "Pay",
                isloading: controller.isLoading.value,
                processed: () {
                  cartcontroller.checkoutt(context);
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
