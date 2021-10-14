import 'package:bmi_new_theme/verticle_weight_slider/src/pointer_config.dart';
import 'package:bmi_new_theme/verticle_weight_slider/src/vertical_weight_slider_widget.dart';
import 'package:bmi_new_theme/verticle_weight_slider/src/weight_slider_controller.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class CentimeterScale extends StatelessWidget {
  CentimeterScale(this.heightText, this.function, this.controller);

  final String heightText;
  final Function(double) function;
  final WeightSliderController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 525,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                heightText,
                style: kHeightTextStyle,
              ),
              Text(
                'cm',
                style: kSmallTextStyle.copyWith(color: kYelloColor),
              )
            ],
          ),
          Flexible(
            //TODO: always wrap this when using a scrollable widget
            child: VerticalWeightSlider(
              height: 350,
              controller: controller,
              maxWeight: 250,
              config: PointerConfig(
                colors: [
                  Colors.grey[700],
                  Colors.grey[500],
                  Colors.grey[200],
                ],
              ),
              onChanged: function,
            ),
          ),
        ],
      ),
    );
  }
}

class FeetScale extends StatelessWidget {
  static int feet = 5, inch = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 200, horizontal: 70),
        child: Row(
          children: [
            FeetTextField(
              textValueFunction: (String newValue) {
                feet = int.parse(newValue);
              },
            ),
            Text(
              ' \' ',
              style: kHeightTextStyle,
            ),
            FeetTextField(
              textValueFunction: (String newValue) {
                inch = int.parse(newValue);
              },
            ),
            Text(
              '\'\'',
              style: kHeightTextStyle,
            ),
          ],
        ));
  }
}

class FeetTextField extends StatelessWidget {
  FeetTextField({@required this.textValueFunction});
  final Function(String)? textValueFunction;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        onChanged: textValueFunction,
        textAlign: TextAlign.center,
        style: kHeightTextStyle.copyWith(color: Colors.white),
        cursorColor: kYelloColor,
        keyboardType: TextInputType.number,
        decoration: height_text_field,
      ),
    );
  }
}
