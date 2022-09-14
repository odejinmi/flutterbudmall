import 'package:flutter/material.dart';
import 'package:flutterbudmall/src/Dashboard/cartcount.dart';
import 'package:flutterbudmall/src/Dashboard/filter.dart';

import '../constant/searchedittext.dart';
import 'bottomnavigation.dart';
import 'dashboarditem.dart';

class Dashboardwithadvert extends StatefulWidget {
  final String banner;
  const Dashboardwithadvert({Key? key, required this.banner}) : super(key: key);

  @override
  _DashboardwithadvertState createState() => _DashboardwithadvertState();
}

class _DashboardwithadvertState extends State<Dashboardwithadvert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Image.network(
                          widget.banner,
                        ),
                        // Image.asset(
                        // package: 'flutterbudmall',"assests/images/combotop.png"),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 50),
                          child: Row(
                            children: [
                              Image.asset(
                                package: 'flutterbudmall',
                                "assests/images/menu.png",
                                height: 36,
                                width: 36,
                              ),
                              const Spacer(),
                              Cartcount()
                            ],
                          ),
                        ),
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
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Dashboarditem(),
          ],
        ),
      ),
      bottomNavigationBar: const Bottomnavigation(position: 1),
    );
  }
}
