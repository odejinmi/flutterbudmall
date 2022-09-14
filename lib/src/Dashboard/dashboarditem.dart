import 'package:flutterbudmall/src/Dashboard/dashboardwithadvert.dart';
import 'package:flutterbudmall/src/Dashboard/filteritem.dart';
import 'package:flutterbudmall/src/Dashboard/saveditem.dart';
import 'package:flutterbudmall/src/request/env_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../controller/dashboardcontroller.dart';
import '../controller/productviewcontroller.dart';
import 'productview.dart';

class Dashboarditem extends StatefulWidget {
  const Dashboarditem({Key? key}) : super(key: key);

  @override
  _DashboarditemState createState() => _DashboarditemState();
}

class _DashboarditemState extends State<Dashboarditem> {
  final dashboardcontroller = Get.put(Dashboardcontroller());
  final productviewcontroller = Get.put(Productviewcontroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<Dashboardcontroller>(builder: (controller) {
        return controller.isLoading.value
            ? loadingWidget2
            : Column(
                children: [
                  Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dashboardcontroller.category.length,
                        itemBuilder: (context, index) {
                          var nDataList = dashboardcontroller.category[index];
                          return Filteritem(nDataList: nDataList);
                        }),
                    height: 104.19,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: bannerList.length,
                        itemBuilder: (context, index) {
                          var nDataList = bannerList[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => Dashboardwithadvert(
                                    banner: nDataList,
                                  ));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Image.network(
                                nDataList,
                                height: 130,
                              ),
                            ),
                          );
                        }),
                    height: 130,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: dashboardcontroller.offers.isNotEmpty,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: const [
                              Text(
                                "Special Offers🔥",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8991AC)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        dashboardcontroller.offers.isNotEmpty
                            ? Wrap(
                                children: [
                                  for (int i = 0; i < 6; i++)
                                    item(dashboardcontroller.offers[i])
                                ],
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Visibility(
                    visible: dashboardcontroller.latestproduct.isNotEmpty,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: const [
                              Text(
                                "Latest Product",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8991AC)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        dashboardcontroller.latestproduct.isNotEmpty
                            ? Wrap(
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    item(dashboardcontroller.latestproduct[i])
                                ],
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Visibility(
                    visible: dashboardcontroller.featuredproduct.isNotEmpty,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: const [
                              Text(
                                "Featured Product",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8991AC)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        dashboardcontroller.featuredproduct.isNotEmpty
                            ? Wrap(
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    item(dashboardcontroller.featuredproduct[i])
                                ],
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              );
      }),
    );
  }

  Widget item(nDalist) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 140,
        height: 192,
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  imageurl + "product/" + nDalist.mainImage,
                  height: 144,
                  width: 140,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${nDalist.name}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
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
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: const Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: const Text(
                    "-30%",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: Saveditem(
                      id: nDalist.id,
                    )),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        productviewcontroller.nDatalist = nDalist;
        Get.to(() => Productview());
      },
    );
  }
}
