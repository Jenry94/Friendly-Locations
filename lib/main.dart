import 'package:fireoze/Constants.dart';
import 'package:fireoze/Login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR
      ),
      title: 'Flutter Demo',
      home: Login(),
    );
  }
}

