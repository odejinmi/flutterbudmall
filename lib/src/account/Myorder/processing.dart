import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class Processing extends StatefulWidget {
  List originList;
  Processing({Key? key, required this.originList}) : super(key: key);

  @override
  State<Processing> createState() => _ProcessingState();
}

class _ProcessingState extends State<Processing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
                visible: widget.originList.length == 0,
                child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text(
                      "No processing orders",
                      style: TextStyle(color: Colors.grey),
                    ))),
            for (int i = 0; i < widget.originList.length; i++)
              if (widget.originList[i].status == 0 ||
                  widget.originList[i].status == 1)
                for (int j = 0;
                    j < widget.originList[i].orderDetail.length;
                    j++)
                  item(widget.originList[i],
                      widget.originList[i].orderDetail[j]),
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
                    Text("${myItem.quantity} item(s)"),
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
                style: TextStyle(fontSize: 16, color: Color(0xffE9B200)),
              ),
            ],
          ),
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
