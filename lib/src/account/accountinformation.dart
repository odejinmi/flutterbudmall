import 'package:flutterbudmall/src/controller/accountinformationcontroller.dart';
import 'package:flutterbudmall/src/controller/productviewcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';

class Accountinformation extends StatefulWidget {
  const Accountinformation({Key? key}) : super(key: key);

  @override
  _AccountinformationState createState() => _AccountinformationState();
}

class _AccountinformationState extends State<Accountinformation> {
  var controller = Get.put(Accountinformationcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Account Information",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            const Text(
              "Full Name",
              style: TextStyle(fontSize: 13, color: Color(0xff8992A3)),
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
              controller: controller.nameController,
              keyboardType: TextInputType.name,
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
              height: 20,
            ),
            const Text(
              "User Name",
              style: TextStyle(fontSize: 13, color: Color(0xff8992A3)),
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
              controller: controller.usernameController,
              keyboardType: TextInputType.name,
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
              height: 20,
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 13, color: Color(0xff8992A3)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Samuelodejinmi@gmail.com",
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
              controller: controller.emailController,
              keyboardType: TextInputType.name,
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
              height: 20,
            ),
            const Text(
              "Date of Birth",
              style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Oct 15, 1997",
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
                  suffixIcon: const Icon(Icons.calendar_today_outlined)),
              controller: controller.dobController,
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
            Row(
              children: const [
                Text(
                  "Password",
                  style: TextStyle(fontSize: 14, color: Color(0xff8992A3)),
                ),
                Spacer(),
                Text(
                  "Change password",
                  style: TextStyle(fontSize: 14, color: primarycolour),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "............",
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
                  suffixIcon: const Icon(Icons.visibility_off)),
              controller: controller.passwordController,
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
              height: 30,
            ),
            Submitbutton(
              name: "Save Changes",
              walletfield: false,
              disable: const Color(0xffE9E9E9),
              textdisablecolor: const Color(0xff8992A3),
              processed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
