import 'package:flutter/material.dart';
import 'package:odev1/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Game',
      home: MyHomePage(),
    );
  }
}
