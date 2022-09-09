import 'package:flutter/material.dart';

class Country extends StatefulWidget {
  final ValueChanged<String>? country, countrycode;
  final ValueChanged<bool>? countryfield;
  bool kin;
  Country(
      {Key? key,
      this.country,
      this.countryfield,
      this.countrycode,
      this.kin = true})
      : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  TextEditingController countryController = TextEditingController();
  String country = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.kin) {
      countryController.text = country;
      Future.delayed(const Duration(milliseconds: 1), () {
        widget.country!(country);
        widget.countryfield!(true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Country"),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Select your country",
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )),
            onTap: () async {
              // final result = await Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => Signupsearchlist(localfile: 'fetchcountries',),
              //     ));
              // setState(() {
              //   String details;
              //   if(result == null) {
              //     // widget.country("");
              //     // countryController.text = "";
              //     widget.countryfield!(false);
              //   }else{
              //     details = result;
              //     var array = details.split(';');
              //     widget.country!(array[0]);
              //     countryController.text = array[0];
              //     widget.countrycode!(array[1]);
              //     countryshortcode=array[2];
              //     print(countryshortcode);
              //     widget.countryfield!(true);
              //   }
              // });
            },
            focusNode: FocusNode(),
            enableInteractiveSelection: false,
            readOnly: true,
            controller: countryController,
            onChanged: (value) {},
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
