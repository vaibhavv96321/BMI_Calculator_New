import 'package:bmi_new_theme/Screens/welcomeScreen.dart';
import 'package:bmi_new_theme/bottom_button.dart';
import 'package:bmi_new_theme/constant.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bodyFat,
      required this.age,
      required this.weight,
      required this.height,
      required this.bmi,
      required this.status});

  final int age;
  final int bodyFat;
  final int height;
  final int weight;
  final double bmi;
  final String status;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgrounColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15),
            child: Center(
              child: RichText(
                text: TextSpan(style: kAppBarHeight, children: <TextSpan>[
                  TextSpan(text: 'Your'),
                  TextSpan(text: ' Result', style: kAppBarTextStyle),
                ]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            height: 220,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'BMI',
                  style: kAppBarTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  bmi.toStringAsFixed(1),
                  style: kHeightTextStyle.copyWith(color: kYelloColor),
                ),
                Text(
                  status,
                  style: kSmallTextStyle.copyWith(
                      color: kBackgrounColor, fontWeight: FontWeight.bold),
                ),
                Text('details')
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kWhiteColor,
              gradient: kMaleGradient,
            ),
          ),
          Center(
            child: Text(
              'Body Composition',
              style: kSmallTextStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Result_page_box('Body Fat', bodyFat.toString() + '%'),
              Result_page_box('Age', age.toString()),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Result_page_box('Height', '$height'),
              Result_page_box('Weight', '$weight'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Bottom_Button(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WelcomeScreen();
            }));
          }, EdgeInsets.symmetric(vertical: 10, horizontal: 125), 'Retry ',
              Icon(Icons.redo))
        ],
      ),
    ));
  }
}

class Result_page_box extends StatelessWidget {
  Result_page_box(this.display_text, this.display_main_text);

  final String display_main_text;
  final String display_text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: kBoxColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Text(
            display_main_text,
            style: TextStyle(
              color: kYelloColor,
              fontFamily: 'com',
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            display_text,
            style: TextStyle(
              color: kWhiteColor,
              fontFamily: 'com',
              fontSize: 15,
            ),
          ),
        ],
      ),
    ));
  }
}
