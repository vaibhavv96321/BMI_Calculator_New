import 'package:bmi_new_theme/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_new_theme/weight_slider_resources/weight_slider.dart';
import 'package:bmi_new_theme/gender_Box.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'height_page.dart';

enum gender { male, female, t }
gender gen = gender.t;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  int age = 20;
  int weight = 80;
  late Animation colorAnimation;
  late Animation backgroundColorAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    animationController();
  }

  void animationController() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controller.forward();

    backgroundColorAnimation =
        ColorTween(begin: kSelectedStuffColor, end: kBackgrounColor)
            .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorAnimation.value,
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'BMI Calculator',
                      textStyle: kAppBarTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  repeatForever: true,
                ),
              ),
            ),
            Row(
              children: [
                GenderBox(
                  genderImage: 'boy.png',
                  genderText: 'MALE',
                  gradient: (gen == gender.male ? kMaleGradient : null),
                  onPress: () {
                    setState(() {
                      gen = gender.male;
                    });
                  },
                ),
                GenderBox(
                  genderImage: 'girl.png',
                  genderText: 'FEMALE',
                  gradient: gen == gender.female ? kFemaleGradient : null,
                  onPress: () {
                    setState(() {
                      gen = gender.female;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                  color: kBoxColor, borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    shape: CircleBorder(),
                    onPressed: () {
                      setState(() {
                        age--;
                      });
                    },
                    child: Icon(FontAwesomeIcons.minus),
                  ),
                  Text(
                    '$age',
                    style: kAgeTextStyle,
                  ),
                  RawMaterialButton(
                    shape: CircleBorder(),
                    onPressed: () {
                      setState(() {
                        age++;
                      });
                    },
                    child: Icon(FontAwesomeIcons.plus),
                  ),
                ],
              ),
            ),
            Text(
              'AGE',
              style: kSmallTextStyle,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: WeightSlider(
                color: kBoxColor,
                height: 80,
                weight: weight,
                minWeight: 40,
                maxWeight: 120,
                onChange: (val) => setState(() => this.weight = val),
              ),
            ),
            Text(
              'WEIGHT',
              style: kSmallTextStyle,
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HeightSelector(
                    weight: weight,
                  );
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: kFemaleGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 150),
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: kAppBarTextStyle,
                    ),
                    Icon(Icons.arrow_forward_sharp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
