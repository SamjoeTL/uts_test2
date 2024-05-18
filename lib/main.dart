import 'package:uts_test/Homepage.dart';
import 'package:flutter/material.dart';
// import 'sample.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosrent',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Ubah Color.blue menjadi Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}
