import 'package:flutter/material.dart';
import 'package:peeples_local/screen/home.dart';

void main() {
  runApp(MyApp());
}
// bool isThemeBGColor = false;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // backgroundColor: isThemeBGColor ? Colors.black : Colors.white,

      ),
      home: HomeScreen(),
    );
  }
}
