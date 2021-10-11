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
    return Expanded(
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
                style: kSmallTextStyle,
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 200, horizontal: 80),
          child: Row(
            children: [
              FeetTextField(),
              Text(
                ' \' ',
                style: kHeightTextStyle,
              ),
              FeetTextField(),
              Text(
                '\'\'',
                style: kHeightTextStyle,
              ),
            ],
          )),
    );
  }
}

class FeetTextField extends StatelessWidget {
  const FeetTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        decoration: InputDecoration(
          labelStyle: kHeightTextStyle,
        ),
      ),
    );
  }
}
