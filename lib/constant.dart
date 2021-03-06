import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBackgrounColor = Color(0xFF0A0716);

const kBoxColor = Color(0xFF202137);

const kSelectedStuffColor = Color(0xFF9688FC);

const kSelectedStuffColor2 = Color(0xFF6251E2);

const kOrangeColor = Color(0xFFFF4A33);

const kWhiteColor = Colors.white;

const kYelloColor = Color(0xFFFCDB65);

const kDetailTextStyle = TextStyle(
  color: kYelloColor,
  fontFamily: 'com',
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const kAppBarTextStyle = TextStyle(
  color: kWhiteColor,
  fontFamily: 'com',
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const kSmallTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'com',
  fontSize: 20,
);

const kMaleGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.2, 0.8],
    colors: [kSelectedStuffColor2, kSelectedStuffColor]);

const kFemaleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.2, 0.8],
    colors: [kSelectedStuffColor2, kSelectedStuffColor]);

const kAgeTextStyle = TextStyle(
  color: kSelectedStuffColor,
  fontFamily: 'com',
  fontSize: 35,
  fontWeight: FontWeight.bold,
);

const colorizeColors = [
  Colors.white,
  kOrangeColor,
  kYelloColor,
  kSelectedStuffColor2,
];

const kAppBarHeight = TextStyle(
  color: kWhiteColor,
  fontFamily: 'com',
  fontSize: 25,
);

const kUnitTextStyle = TextStyle(
  color: kWhiteColor,
  fontWeight: FontWeight.bold,
  fontSize: 22,
  fontFamily: 'com',
);

const kUnitGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.8],
    colors: [kSelectedStuffColor, kSelectedStuffColor2]);

const kHeightTextStyle = TextStyle(
  fontSize: 90,
  fontFamily: 'com',
  fontWeight: FontWeight.bold,
  color: kWhiteColor,
);

const height_text_field = InputDecoration(
  labelStyle: kHeightTextStyle,
  fillColor: kYelloColor,
  hoverColor: kYelloColor,
  focusColor: kYelloColor,
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: kYelloColor)),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kYelloColor, width: 3.0),
  ),
);
