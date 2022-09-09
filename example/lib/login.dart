import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';
import 'passwordwidget.dart';
import 'signincontroller.dart';
import 'submitbutton.dart';

class Login extends StatelessWidget {
  final signincontroller = Get.put(Signincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<Signincontroller>(builder: (conttoller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assests/images/budmall.png",
                  height: 59.09,
                  width: 166.52,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      "Please login to use the app",
                      style: TextStyle(fontSize: 15, color: Color(0xff8992A3)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email or user name",
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
                  ),
                  controller: conttoller.emailController.value,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    // widget.email(value);
                    if (value.isEmpty) {
                    } else {}
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field can't be empty";
                    }

                    if (!EmailValidator.validate(value)) {
                      return "Invalid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Passwordwidget(
                  hint: "Type password",
                  password: (v) {
                    conttoller.passwordController.value.text = v;
                  },
                  passfield: (v) {
                    conttoller.passfield.value = v;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Row(
                    children: const [
                      Spacer(),
                      Text(
                        "Forget password?",
                        style:
                            TextStyle(color: Color(0xff222B45), fontSize: 16),
                      )
                    ],
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                Submitbutton(
                  isloading: conttoller.isLoading.value,
                  name: "Sign in",
                  processed: () {
                    if (conttoller.emailController.value.text != "" &&
                        conttoller.passwordController.value.text != "") {
                      conttoller.initiate(context);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
