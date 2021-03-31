import 'package:flutter/material.dart';
import 'package:know_your_medic/AuthPages/get_started.dart';
import 'package:know_your_medic/AuthPages/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
        primaryColor: Color(0xffb12341),
        fontFamily: 'Quicksand',        
      ),
      home: GetStarted(),
    );
  }
}