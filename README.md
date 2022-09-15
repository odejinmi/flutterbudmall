# flutterbudmall

A Budmall Plugin for Flutter Apps

Flutter plugin for online shopping with Budmall Payment System. Fully
supports all platform.

## Getting Started

## Installation
To use this plugin, add `flutterbudmall` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

Then initialize the plugin preferably in the `initState` of your widget.

``` dart
import 'package:flutterbudmall/flutterbudmall.dart';

class _ExamplePayementPageState extends State<ExamplePayementPage> {
  var email = 'Add your customer email Here';
  final plugin = Budmall();

  @override
  void initState() {
    plugin.initialize(emailed: email);
  }
}
```

## Making Payments
The way to puchase goods with the plugin.

 ```dart
    plugin.checkout();
 ```


## Running Example project
For help getting started with Flutter, view the online [documentation](https://flutter.dev).

An [example project](https://github.com/odejinmi/flutterbudmall) has been provided in this plugin.
Clone this repo and navigate to the **example** folder. Open it with a supported IDE or execute `flutter run` from that folder in terminal.

## Contributing, Issues and Bug Reports
The project is open to public contribution. Please feel very free to contribute.
Experienced an issue or want to report a bug? Please, [report it here](https://github.com/odejinmi/flutterbudmall/issues). Remember to be as descriptive as possible.