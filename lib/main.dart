import 'package:flutter/material.dart';
import 'package:naviagtion_bars/combine2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: NavigationBarController(),
    );

  }
}
