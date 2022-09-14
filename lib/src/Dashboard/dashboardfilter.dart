import 'package:flutterbudmall/src/Dashboard/filteritem.dart';
import 'package:flutterbudmall/src/constant/constant.dart';
import 'package:flutter/material.dart';

class Dashboardfilter extends StatelessWidget {
  const Dashboardfilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              for (int i = 0; i < originList.length; i++)
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    child: Filteritem(nDataList: originList[i]))
            ],
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
