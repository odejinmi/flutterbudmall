import 'package:flutterbudmall/src/Dashboard/productview.dart';
import 'package:flutterbudmall/src/Dashboard/saveditem.dart';
import 'package:flutterbudmall/src/request/env_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../controller/productviewcontroller.dart';

class Filterboarditem extends StatelessWidget {
  var item;
  Filterboarditem({Key? key, this.item}) : super(key: key);

  final productviewcontroller = Get.put(Productviewcontroller());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 140,
        height: 299.44,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imageurl + "product/" + item.mainImage,
                  height: 144,
                  width: 140,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 10),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$Naira${item.basePrice}",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.shopping_cart,
                      color: primarycolour,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.6K",
                      style: TextStyle(fontSize: 11),
                    ),
                    Spacer(),
                    Icon(
                      Icons.visibility,
                      color: primarycolour,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.6K",
                      style: TextStyle(fontSize: 11),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 28,
                  width: 58,
                  decoration: const BoxDecoration(
                      color: Color(0xff656565),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: const Text(
                    "-30%",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Saveditem(
                    id: item.id,
                    added: true,
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        productviewcontroller.nDatalist = item;
        Get.to(() => Productview());
      },
    );
  }
}
