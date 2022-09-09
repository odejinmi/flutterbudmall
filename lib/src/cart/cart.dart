import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account/addnewdeliveryaddress.dart';
import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';
import '../controller/cartcontroller.dart';
import '../controller/deliveryaddresscontroller.dart';
import '../request/env_variable.dart';
import 'itemcounter.dart';
import 'payment.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var cartcontroller = Get.put(Cartcontroller());
  final deliveryaddresscontroller = Get.put(Deliveryaddresscontroller());
  @override
  Widget build(BuildContext context) {
    cartcontroller.initiate();
    return Scaffold(
      appBar: CostumeAppbar(
        name: const Text(
          "Your Bag",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: GetX<Cartcontroller>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              for (int i = 0; i < controller.originList.length; i++)
                item(controller.originList[i]),
              const Spacer(),
              const Divider(),
              const SizedBox(
                height: 10,
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
                    "$Naira${controller.total.value}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Submitbutton(
                name: "Confirm Bill",
                isloading: controller.isLoading.value,
                processed: () {
                  print(defaultaddress);
                  if (defaultaddress == null) {
                    // cartcontroller.shippingfe(context);
                    Get.to(() => Addnewdeliveryaddress());
                    return;
                  }
                  Get.to(() => const Payment());
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

  Widget item(list) {
    return Container(
      // height: 80,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.network(
            imageurl + "product/" + list.product.mainImage,
            height: 80,
            width: 80,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list.product.name,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$Naira${list.product.basePrice}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    // Spacer(),
                    Itemcounter(
                      available: list.product.inStock,
                      cart: true,
                      id: list.id,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
