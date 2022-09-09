import 'package:flutter/material.dart';

class Customeswitch extends StatefulWidget {
  final Color activecolor, inactivecolor, trackactivecolor, trackinactivecolor;
  final bool value;
  final ValueChanged<bool> changevalue;
  const Customeswitch(
      {Key? key,
      this.activecolor = Colors.white,
      this.inactivecolor = Colors.white,
      this.trackactivecolor = Colors.green,
      this.trackinactivecolor = Colors.red,
      this.value = false,
      required this.changevalue})
      : super(key: key);

  @override
  _CustomeswitchState createState() => _CustomeswitchState();
}

class _CustomeswitchState extends State<Customeswitch> {
  double left = 2, right = 20;
  Color color = Colors.green;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.changevalue(widget.value);
    if (widget.value) {
      positiontrue();
    } else {
      positionfalse();
    }
  }

  void positiontrue() {
    right = 2;
    left = 20;
  }

  void positionfalse() {
    right = 20;
    left = 2;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onHorizontalDragStart: (d){
      //   // print(d);
      // },
      onTap: () {
        setState(() {
          if (!widget.value) {
            widget.changevalue(true);
            positiontrue();
          } else {
            widget.changevalue(false);
            positionfalse();
          }
        });
      },
      onHorizontalDragEnd: (d) {
        setState(() {
          if (left >= 10) {
            positiontrue();
            widget.changevalue(true);
          } else {
            positionfalse();
            widget.changevalue(false);
          }
        });
      },
      // onHorizontalDragDown: (d){
      //   // print(d);
      // },
      onHorizontalDragUpdate: (d) {
        setState(() {
          if (d.delta.dx.isNegative) {
            if (left >= 2) {
              right += 1;
              left -= 1;
            }
          } else {
            if (right >= 2) {
              right -= 1;
              left += 1;
            }
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.value
                ? widget.trackactivecolor
                : widget.trackinactivecolor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Container(
          margin: EdgeInsets.only(top: 2, bottom: 2, right: right, left: left),
          decoration: BoxDecoration(
              color: widget.value ? widget.activecolor : widget.inactivecolor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}

class Customeswitchtext extends StatefulWidget {
  final String? truetext, falsetext;
  final bool value;
  const Customeswitchtext(
      {Key? key, this.truetext, this.falsetext, this.value = true})
      : super(key: key);

  @override
  _CustomeswitchtextState createState() => _CustomeswitchtextState();
}

class _CustomeswitchtextState extends State<Customeswitchtext> {
  bool value = true;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        value
            ? Text(
                widget.truetext.toString(),
                style: const TextStyle(color: Colors.green),
              )
            : Text(
                widget.falsetext.toString(),
                style: const TextStyle(color: Colors.red),
              ),
        const SizedBox(
          width: 15,
        ),
        Customeswitch(
          value: value,
          changevalue: (d) {
            setState(() {
              value = d;
            });
          },
        ),
      ],
    );
  }
}
