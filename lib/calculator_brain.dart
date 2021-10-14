import 'dart:math';

import 'package:flutter/cupertino.dart';

class Brain {
  Brain({@required this.height = 0, @required this.weight = 0});

  final double height;
  final int weight;

  double bmi = 0;

  double bmivalue() {
    bmi = (weight / (pow(height / 100, 2)));
    return bmi; // this will print the value upto ones digit
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

  String suggestion() {
    if (bmi > 30)
      return 'You Really need to think about it and get really Motivated';
    else if (bmi > 25) {
      return 'Its not too late just get up and start Working out!';
    } else if (bmi > 18) {
      return 'Congratulations! you are under the normal weight catogary';
    } else {
      return 'You need to Exercise and Eat a lot ! Thats All.';
    }
  }
}
