import 'package:flutter/material.dart';

class Diapad extends StatefulWidget {
  ValueChanged<String>? addValue, remove;
  String lastnumber;
  Color color;

  Diapad(
      {Key? key,
      this.addValue,
      this.remove,
      this.lastnumber = "",
      this.color = Colors.black})
      : super(key: key);

  @override
  _DiapadState createState() => _DiapadState();
}

class _DiapadState extends State<Diapad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            button("1"),
            const SizedBox(
              width: 30,
            ),
            button("2"),
            const SizedBox(
              width: 30,
            ),
            button("3"),
          ],
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            button("4"),
            const SizedBox(
              width: 30,
            ),
            button("5"),
            const SizedBox(
              width: 30,
            ),
            button("6"),
          ],
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            button("7"),
            const SizedBox(
              width: 30,
            ),
            button("8"),
            const SizedBox(
              width: 30,
            ),
            button("9"),
          ],
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            button(""),
            const SizedBox(
              width: 30,
            ),
            button("0"),
            const SizedBox(
              width: 30,
            ),
            buttonwidget(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: widget.color,
                ),
                number: () {
                  widget.remove!("");
                }),
          ],
        ),
      ],
    );
  }

  Widget button(number) {
    return buttonwidget(
        child: Text(
          number,
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        number: () {
          widget.addValue!(number);
        });
  }

  Widget buttonwidget({Widget? child, Function? number}) {
    return ElevatedButton(
      style: ButtonStyle(
          // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(120)),
        // side: BorderSide(color: Colors.red)
      ))),
      onPressed: () async {
        number!();
      },
      // splashColor: Colors.blue[50],
      child: child!,
    );
  }
}
