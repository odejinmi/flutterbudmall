import 'package:flutter/material.dart';

import 'diapad.dart';

class Transactionpin extends StatefulWidget {
  const Transactionpin({Key? key}) : super(key: key);

  @override
  _TransactionpinState createState() => _TransactionpinState();
}

class _TransactionpinState extends State<Transactionpin> {
  TextEditingController emailController = TextEditingController();
  int pinLength = 6;
  void remove(dynamic) {
    setState(() {
      if (emailController.text.isEmpty) {
        emailController.text = "";
      } else {
        emailController.text =
            emailController.text.substring(0, emailController.text.length - 1);
      }
    });
  }

  void addValue(String value) {
    setState(() {
      if (emailController.text.length <= pinLength - 1) {
        if (emailController.text.length == 0) {
          emailController.text = value;
        } else {
          emailController.text += value;
        }
        if (emailController.text.length == pinLength) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return const Dashboard();
          //     },
          //   ),
          // );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              package: 'flutterbudmall',
              "assests/images/close.png",
              height: 37,
              width: 37,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  border: Border.all(color: Color(0xffF5F5F5))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Enter you 4 digit pin"),
                  const SizedBox(
                    height: 90,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < pinLength; i++)
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: emailController.text.isEmpty
                                    ? Colors.white
                                    : i > emailController.text.length - 1
                                        ? Colors.white
                                        : Colors.black,
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(1000)),
                                border: Border.all(
                                    color: emailController.text.isEmpty
                                        ? Color(0xff3869CC)
                                        : i > emailController.text.length - 1
                                            ? Color(0xff3869CC)
                                            : Colors.black)),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Expanded(
                    child: Diapad(
                      addValue: addValue,
                      remove: remove,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
