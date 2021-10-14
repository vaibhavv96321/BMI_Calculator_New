import 'package:bmi_new_theme/Screens/Result_Page.dart';
import 'package:bmi_new_theme/Screens/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_new_theme/Screens/height_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: ResultPage(),
    );
  }
}
