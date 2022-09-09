import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/itemcounter.dart';
import '../constant/constant.dart';
import '../constant/costumeAppbar.dart';
import '../constant/submitbutton.dart';
import '../controller/productviewcontroller.dart';
import '../request/env_variable.dart';
import 'saveditem.dart';

class Productview extends StatelessWidget {
  Productview({Key? key}) : super(key: key);

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 8.0 : 8.0,
      width: isCurrentPage ? 8.0 : 8.0,
      decoration: BoxDecoration(
        color:
            isCurrentPage ? const Color(0xffE9B200) : const Color(0xffFCEAB2),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  var productviewcontroller = Get.put(Productviewcontroller());

  @override
  Widget build(BuildContext context) {
    productviewcontroller.itemcountercontroller.available.value =
        productviewcontroller.nDatalist.inStock;
    if (productviewcontroller.fullProductDetails != null) {
      productviewcontroller.fullProductDetails.relatedProducts.clear();
    }
    productviewcontroller.productDetails();
    return Scaffold(
      body: SingleChildScrollView(
        child: GetX<Productviewcontroller>(builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostumeAppbar(
                  name: const Text(""),
                  child: Saveditem(
                    id: controller.nDatalist.id,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 303,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: const Color(0xff979797))),
                  child: Image.network(
                    imageurl + "product/" + controller.nDatalist.mainImage,
                    height: 303,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     const Spacer(),
                //     for (int i = 0; i < 3; i++) _buildPageIndicator(i == 0),
                //     const Spacer(),
                //   ],
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                Text(
                  controller.nDatalist.name,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "$Naira${sammy.format(double.parse(controller.nDatalist.basePrice))}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 28,
                      width: 81,
                      decoration: const BoxDecoration(
                          color: primarycolour,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      alignment: Alignment.center,
                      child: const Text(
                        "18% off",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Spacer(),
                    Itemcounter(
                      available: controller.nDatalist.inStock,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                // const SizedBox(
                //   height: 10,
                // ),
                // const Text.rich(TextSpan(children: [
                //   TextSpan(
                //       text: "Offers end in ",
                //       style:
                //           TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                //   TextSpan(
                //       text: "13 hours 20 minutes",
                //       style:
                //           TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                // ])),
                // const SizedBox(
                //   height: 10,
                // ),
                // const Divider(),
                const Text("Description",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.nDatalist.description.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff77838F),
                  ),
                ),
                Submitbutton(
                  name: "Add to cart",
                  isloading: productviewcontroller.isLoading.value,
                  processed: () {
                    productviewcontroller.add();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text("Maybe you like",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(color: primarycolour, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                productviewcontroller.fullProductDetails != null
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0;
                                i <
                                    productviewcontroller.fullProductDetails
                                        .relatedProducts.length;
                                i++)
                              item(productviewcontroller
                                  .fullProductDetails.relatedProducts[i]),
                          ],
                        ),
                      )
                    : Container(),
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

  Widget item(nDalist) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 140,
      // height: 192,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageurl + "product/" + nDalist.mainImage,
                height: 130,
                width: 130,
              ),
              const SizedBox(
                height: 5,
              ),
              // Text(
              //   nDalist.description,
              //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              // ),
              // const SizedBox(
              //   height: 7,
              // ),
              Text(
                nDalist.name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              )
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
                    id: productviewcontroller.nDatalist.id,
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
