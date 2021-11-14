import 'dart:math';

import 'package:bmi_new_theme/Screens/welcomeScreen.dart';
import 'package:bmi_new_theme/bottom_button.dart';
import 'package:bmi_new_theme/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
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
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int minweight = 0;
  int maxweight = 0;
  bool detail_tap = true;
  int differ_weight = 0;

  @override
  void initState() {
    min_weight();
    max_weight();
    differ();
    super.initState();
  }

  void min_weight() {
    minweight = (18 * pow(widget.height / 100, 2)).toInt();
  }

  void max_weight() {
    maxweight = (25 * pow(widget.height / 100, 2)).toInt();
  }

  void differ() {
    if (widget.weight < minweight) {
      differ_weight = widget.weight - minweight;
    } else if (widget.weight > maxweight) {
      differ_weight = widget.weight - maxweight;
    } else {
      differ_weight = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgrounColor,
      body: ListView(
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
            height: 250,
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
                  widget.bmi.toStringAsFixed(1),
                  style: kHeightTextStyle.copyWith(color: kYelloColor),
                ),
                Text(
                  widget.status,
                  style: kSmallTextStyle.copyWith(
                      color: kBackgrounColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                RawMaterialButton(
                  child: Text(detail_tap ? 'details' : 'close details'),
                  onPressed: () {
                    setState(() {
                      detail_tap = !detail_tap;
                    });
                  },
                ),
                //TODO: i have to make a expansion panel here in place of details to expand it so that i can add the range for perfect bmi and also differnce between current and perfect
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kWhiteColor,
              gradient: kMaleGradient,
            ),
          ),
          detail_tap //TODO: here i have implemented the tertionary operator that if the value is changed then the code is also changed
              ? Column(children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Difference',
                    style: kAppBarTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    differ_weight.toString() + 'kg',
                    style: kDetailTextStyle,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Perfect Range(kg)',
                    style: kAppBarTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                      minweight.toString() +
                          '.0 - ' +
                          maxweight.toString() +
                          '.0',
                      style: kDetailTextStyle),
                  SizedBox(
                    height: 30,
                  ),
                ])
              : Column(
                  children: [
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
                        Result_page_box(
                            'Body Fat', widget.bodyFat.toString() + '%'),
                        Result_page_box('Age', widget.age.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Result_page_box('Height', '${widget.height}'),
                        Result_page_box('Weight', '${widget.weight}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
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
            style: kDetailTextStyle,
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
