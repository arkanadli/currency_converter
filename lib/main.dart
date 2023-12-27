import 'package:currency_converter/currency_converter_cupertinoVer.dart';
import 'package:currency_converter/currency_converter_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  // runApp(MyApp());
  runApp(const MyApp());
}

// Types of Widgets
// 1. Stateless Widgets // a widget that does not require mutable state
// 2. Statefull Widgets // a widget that has mutable state
// :: type stfl to create template statefull Widget
// 3. inherited Widgets // more advanced topic

// state is a data that related to widget.

// theres two type of design
// 1. Material Design // created widget by google
// 2. Cupertino Design // created widget design by Apple

// when we using materialapp, it is like a big scale of playground that contains all material design function
// and then in those playground, we want to have some smaller scale with scaffold, thats why we need scaffold
// we can have more than 1 scaffold in in 1 material app
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // constructor will send the param to Extended class

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterHomepage(),
    );
  }
}

class MyCuppertionApp extends StatelessWidget {
  const MyCuppertionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoVersion(),
    );  
  }
}
