import 'package:flutter/material.dart';
import 'package:flutterbudmall/src/Dashboard/dashboardfilter.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48,
        width: 71,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(10)),
            color: Colors.white),
        child: Image.asset(
          package: 'flutterbudmall',
          "assests/images/filter.png",
          height: 24,
          width: 24,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20.0))),
            context: context,
            isScrollControlled: true,
            builder: (context) => Dashboardfilter());
      },
    );
  }
}
