import 'package:flutter/material.dart';

import 'constant.dart';

class Submitbutton extends StatefulWidget {
  bool walletfield, isloading;
  Function? processed;
  Widget loading;
  Color disable, textcolor, textdisablecolor, buttoncolor;
  String name;
  double width;

  Submitbutton(
      {Key? key,
      this.walletfield = true,
      this.name = "Proceed",
      this.isloading = false,
      this.processed,
      this.textcolor = Colors.white,
      this.textdisablecolor = Colors.white,
      this.width = 0.0,
      this.disable = disablecolor,
      this.buttoncolor = primarycolour,
      this.loading = loadingWidget})
      : super(key: key);

  @override
  _SubmitbuttonState createState() => _SubmitbuttonState();
}

class _SubmitbuttonState extends State<Submitbutton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width == 0.0 ? size.width : widget.width,
      height: 70,
      padding: const EdgeInsets.only(top: 16.0),
      child: Card(
        color: !widget.walletfield ? Color(0xffF0F0FB) : widget.buttoncolor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            //   // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                !widget.walletfield ? widget.disable : widget.buttoncolor),
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(10)),
            //           // side: BorderSide(color: Colors.red)
            //         ))
          ),
          child: widget.isloading
              ? widget.loading
              : Text(widget.name,
                  style: TextStyle(
                    color: !widget.walletfield
                        ? widget.textdisablecolor
                        : widget.textcolor,
                    fontSize: 17,
                  )),
          onPressed: () {
            if (!widget.isloading) {
              if (widget.walletfield) {
                FocusScope.of(context).requestFocus(FocusNode());
                widget.processed!();
              }
            }
          },
        ),
      ),
    );
  }
}
