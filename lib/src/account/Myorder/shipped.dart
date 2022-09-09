import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class Shipped extends StatelessWidget {
  List originList;
  Shipped({Key? key, required this.originList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
                visible: originList.length == 0,
                child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text(
                      "No shipped orders",
                      style: TextStyle(color: Colors.grey),
                    ))),
            for (int i = 0; i < originList.length; i++)
              if (originList[i].status == 3 || originList[i].status == 4)
                for (int j = 0; j < originList[i].orderDetail.length; j++)
                  item(originList[i], originList[i].orderDetail[j]),
          ],
        ),
      ),
    );
  }

  Widget item(myOrderItem, myItem) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                package: 'flutterbudmall',
                "assests/images/myorder.png",
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${myItem.productName}",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("${myItem.quantity} items"),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "ID Order",
                style: TextStyle(fontSize: 16, color: Color(0xff8992A3)),
              ),
              Spacer(),
              Text(
                "#${myOrderItem.orderNumber}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Text(
                "Total Product",
                style: TextStyle(fontSize: 16, color: Color(0xff8992A3)),
              ),
              const Spacer(),
              Text(
                "${Naira}${sammy.format(double.parse(myItem.totalPrice))}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                "Status",
                style: TextStyle(fontSize: 16, color: Color(0xff8992A3)),
              ),
              Spacer(),
              Text(
                "${myOrderItem.status == 0 ? 'Waiting' : myOrderItem.status == 1 ? 'Processing' : myOrderItem.status == 2 ? 'Dispatched' : 'Delivered'}",
                style: TextStyle(fontSize: 16, color: Color(0xff00C181)),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 15,
          // ),
          // Row(
          //   children: [
          //     const Text(
          //       "Rate for products",
          //       style: TextStyle(fontSize: 15, color: primarycolour),
          //     ),
          //     const Spacer(),
          //     Container(
          //       alignment: Alignment.center,
          //       height: 32,
          //       width: 94,
          //       decoration: const BoxDecoration(
          //           color: primarycolour,
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       child: const Text(
          //         "Re-Order",
          //         style: TextStyle(fontSize: 13, color: Colors.white),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
