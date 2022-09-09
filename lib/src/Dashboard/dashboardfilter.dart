import 'package:flutter/material.dart';

import '../constant/constant.dart';
import 'filteritem.dart';

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
          const SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              for (int i = 0; i < originList.length; i++)
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    child: Filteritem(nDataList: originList[i]))
            ],
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
