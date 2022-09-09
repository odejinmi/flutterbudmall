import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/searchedittext.dart';
import 'cartcount.dart';
import 'filter.dart';
import 'filterboarditem.dart';

class Filterboard extends StatefulWidget {
  var item;
  Filterboard({Key? key, required this.item}) : super(key: key);

  @override
  _FilterboardState createState() => _FilterboardState();
}

class _FilterboardState extends State<Filterboard> {
  int selected = 0;
  List tag = ["Biscuits &..", "Flour", "Garri", "Frozen FO..", "Beverag..."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xffE9B200),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        const Spacer(),
                        // Image.asset(
                        //   package: 'flutterbudmall',"assests/images/${widget.item["name"].toString().replaceAll(" ", "")
                        //     .replaceAll("/", "").replaceAll("&", "").toLowerCase()}top.png",
                        //   height: 145.69, width: 145.69,
                        // ),
                        Image.asset(
                          package: 'flutterbudmall',
                          "assests/images/babyproductstop.png",
                          height: 145.69,
                          width: 145.69,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                package: 'flutterbudmall',
                                "assests/images/newback.png",
                                height: 36,
                                width: 36,
                              ),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                widget.item.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Cartcount()
                          ],
                        ),
                      ),
                      const SizedBox(),
                      Row(
                        children: [
                          Expanded(child: Searchedittext()),
                          const Filter(),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 32,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: tag.length,
                  itemBuilder: (context, index) {
                    var nDataList = tag[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                        // Get.to(()=> Dashboardwithadvert(banner: nDataList,));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 87,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: selected == index
                                ? Colors.black
                                : Colors.white),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          nDataList,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: selected == index
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                for (int i = 0; i < 10; i++)
                  Filterboarditem(
                    item: widget.item,
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
