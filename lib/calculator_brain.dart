import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'Screens/welcomeScreen.dart';

class Brain {
  Brain(
      {@required this.height = 0,
      @required this.weight = 0,
      @required this.age = 0,
      @required this.gen = gender.t});

  final double height;
  late final int weight;
  final int age;
  final gender gen;

  double bmi = 0;
  int bodyFat = 0;

  double bmivalue() {
    bmi = (weight / (pow(height / 100, 2)));
    return bmi; // this will print the value upto ones digit
  }

  int body_fat() {
    if (gen == gender.male) {
      bodyFat = ((1.20 * bmi) + (0.23 * age) - 16.2).toInt();
    } else if (gen == gender.female) {
      bodyFat = ((1.20 * bmi) + (0.23 * age) - 5.4).toInt();
    }
    return bodyFat;
  }

  String status() {
    if (bmi > 30)
      return 'Obese';
    else if (bmi > 25) {
      return 'Overweight';
    } else if (bmi > 18) {
      return 'Normal Weight';
    } else {
      return 'UnderWeight';
    }
  }
}
