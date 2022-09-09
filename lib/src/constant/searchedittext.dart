import 'package:flutter/material.dart';

import '../model/countrylistparser.dart';

class Searchedittext extends StatefulWidget {
  Searchedittext(
      {Key? key, this.originList, this.handleList, this.hint = 'Search'})
      : super(key: key);
  List? originList = [];
  ValueChanged<List>? handleList;
  String hint;

  @override
  State<Searchedittext> createState() => _SearchedittextState();
}

class _SearchedittextState extends State<Searchedittext> {
  void _search(String text) {
    if (text.isEmpty) {
      widget.handleList!(widget.originList!);
    } else {
      List list = widget.originList!.where((v) {
        return v.name.toLowerCase().contains(text.toLowerCase());
      }).toList();
      widget.handleList!(list);
    }
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 225, 226, 230), width: 0.33),
          color: const Color.fromARGB(255, 239, 240, 244),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        autofocus: false,
        onChanged: (value) {
          _search(value);
        },
        controller: textEditingController,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xFF333333),
            ),
            suffixIcon: Offstage(
              offstage: textEditingController.text.isEmpty,
              child: InkWell(
                onTap: () {
                  textEditingController.clear();
                  _search('');
                },
                child: const Icon(
                  Icons.cancel,
                  color: Color(0xFF999999),
                ),
              ),
            ),
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Color(0xFF999999))),
      ),
    );
  }
}
