import 'package:flutter/material.dart';

import '../cart/check.dart';
import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';

class Paymentmethod extends StatefulWidget {
  const Paymentmethod({Key? key}) : super(key: key);

  @override
  _PaymentmethodState createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  TextEditingController amountController = TextEditingController();
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "My Payment Method",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
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
                          child: Image.asset(
                            package: 'flutterbudmall',
                            "assests/images/marstercard.png",
                            height: 40.32,
                            width: 60.48,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(".... .... .... .068",
                            style: TextStyle(
                              fontSize: 13,
                            )),
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
                    height: 10,
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
                          child: Image.asset(
                            package: 'flutterbudmall',
                            "assests/images/marstercard.png",
                            height: 40.32,
                            width: 60.48,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(".... .... .... .235",
                            style: TextStyle(
                              fontSize: 13,
                            )),
                        const Spacer(),
                        GestureDetector(
                          child: Check(selected: selected, position: 1),
                          onTap: () {
                            setState(() {
                              selected = 1;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Column(
            // const Spacer(),
            //     children: const [
            //       Text("Don't have a payment Method",
            //         style: TextStyle(
            //             fontSize: 22,
            //             color: Color(0xffD6D6D6)
            //         ),
            //         textAlign: TextAlign.center,
            //       ),
            //       SizedBox(height: 20,),
            //       Text("Please create a new payment method",
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: Color(0xffD6D6D6)
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add new Payment Method",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: const Color(0xffEDF1F7))),
                    child: Row(
                      children: [
                        Image.asset(
                          package: 'flutterbudmall',
                          "assests/images/Rectangle.png",
                          height: 35,
                          width: 53,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text("Master Card"),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 13,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Card number",
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
                    controller: amountController,
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
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Valid thru",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Color(edittextbodercolour)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Color(edittextbodercolour)),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Color(edittextbodercolour)),
                              ),
                              suffixIcon:
                                  const Icon(Icons.keyboard_arrow_down)),
                          controller: amountController,
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
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "cvv",
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
                          controller: amountController,
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Submitbutton(
                    name: "Add new Payment",
                    walletfield: false,
                    disable: const Color(0xffE9E9E9),
                    textdisablecolor: const Color(0xff8992A3),
                    processed: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
