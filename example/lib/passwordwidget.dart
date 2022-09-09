import 'package:flutter/material.dart';

import 'constant.dart';

class Passwordwidget extends StatefulWidget {
  final ValueChanged<String>? password;
  final ValueChanged<bool>? passfield;
  String? hint;
  Passwordwidget({Key? key, this.passfield, this.password, this.hint})
      : super(key: key);

  @override
  _PasswordwidgetState createState() => _PasswordwidgetState();
}

class _PasswordwidgetState extends State<Passwordwidget> {
  bool obscureText = true;
  TextEditingController passwordController = TextEditingController();
  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(color: Color(edittextbodercolour)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(color: Color(edittextbodercolour)),
              ),
              hintText: widget.hint,
              suffixIcon: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.transparent,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // side: BorderSide(color: Colors.red)
                    ))),
                onPressed: () {
                  _toggle();
                },
                child: obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            controller: passwordController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  widget.passfield!(true);
                  widget.password!(value);
                });
              } else {
                setState(() {
                  widget.passfield!(false);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "This field can't be empty";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
