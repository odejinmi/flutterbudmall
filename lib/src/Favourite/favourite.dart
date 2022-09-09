import 'dart:convert';

import 'package:flutter/material.dart';

import '../Dashboard/bottomnavigation.dart';
import '../Dashboard/filterboarditem.dart';
import '../constant/constant.dart';
import '../model/favouriteperser.dart';
import '../request/apis.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  var isLoading = false;
  var favouriteproducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Favourite",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? loadingWidget2
            : Container(
                child: Wrap(
                  children: [
                    for (int i = 0; i < favouriteproducts.length; i++)
                      Filterboarditem(
                        item: favouriteproducts[i].product,
                      )
                  ],
                ),
              ),
      ),
      bottomNavigationBar: const Bottomnavigation(position: 3),
    );
  }

  void initiate() async {
    String res;

    isLoading = true;

    res = await getwishlist();

    isLoading = false;

    var cmddetails = jsonDecode(res);

    if (cmddetails['status']) {
      favouriteproducts =
          favouriteperserFromJson(jsonEncode(cmddetails['data']));
      setState(() {});
      // Get.to( ()=> Verificationcode(data: cmddetails['data'],));
    } else {
      if (cmddetails['message'] != "No internet connection") {
        // showCommonError(cmddetails['message'], context);
      }
    }
  }
}
