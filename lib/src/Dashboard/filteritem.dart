import 'package:flutter/material.dart';
import 'package:flutterbudmall/src/Dashboard/filterboard.dart';
import 'package:get/get.dart';

class Filteritem extends StatelessWidget {
  var nDataList;
  Filteritem({Key? key, required this.nDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 94,
        width: 71,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            // Image.network(imageurl+"category"+nDataList.image,
            //   height: 70, width: 71,
            // ),
            Image.asset(
              package: 'flutterbudmall',
              "assests/images/babyproducts.png",
              height: 70,
              width: 71,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              nDataList.name,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
      ),
      onTap: () {
        Get.to(() => Filterboard(
              item: nDataList,
            ));
      },
    );
  }
}
