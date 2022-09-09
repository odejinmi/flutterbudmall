import 'dart:convert';

import 'package:flutter/material.dart';

import '../request/apis.dart';

class Saveditem extends StatefulWidget {
  var id, added;
  Saveditem({Key? key, this.id, this.added = false}) : super(key: key);

  @override
  State<Saveditem> createState() => _SaveditemState();
}

class _SaveditemState extends State<Saveditem> {
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = widget.added;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Image.asset(
          package: 'flutterbudmall',
          "assests/images/${selected ? 'selectedlove' : 'addlove'}.png",
          height: 30.74,
          width: 30.74,
        ),
        onTap: () {
          if (selected) {
            remove();
          } else {
            add();
          }
        },
      ),
    );
  }

  void remove() async {
    String res;

    res = await removewishlist(widget.id.toString());

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      setState(() {
        selected = false;
      });
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }

  void add() async {
    String res;

    var jsonBody = {
      "product_id": widget.id.toString(),
    };

    res = await addwishlist(jsonBody);

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      setState(() {
        selected = true;
      });
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
