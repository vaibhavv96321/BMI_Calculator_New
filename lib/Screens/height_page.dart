import 'package:bmi_new_theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:bmi_new_theme/verticle_weight_slider/vertical_weight_slider.dart';

enum unit { cm, ft, t }

class HeightSelector extends StatefulWidget {
  @override
  _HeightSelectorState createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  unit uni = unit.cm;
  late WeightSliderController _controller;
  double _height = 170;
  int _minHeight = 100;

  @override
  void initState() {
    super.initState();
    _controller =
        WeightSliderController(initialWeight: _height, minWeight: _minHeight);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgrounColor,
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: RichText(
              text: TextSpan(style: kAppBarHeight, children: <TextSpan>[
                TextSpan(text: 'Select your'),
                TextSpan(text: ' Height', style: kAppBarTextStyle),
              ]),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                color: kBoxColor,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 100),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: uni == unit.cm ? kUnitGradient : null,
                        borderRadius: BorderRadius.circular(12)),
                    child: RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          uni = unit.cm;
                        });
                      },
                      child: Text(
                        'cm',
                        style: kUnitTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: uni == unit.ft ? kUnitGradient : null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          uni = unit.ft;
                        });
                      },
                      child: Text(
                        'ft',
                        style: kUnitTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${_height.toInt()}',
                      style: kHeightTextStyle,
                    ),
                    Text(
                      '${uni == unit.cm ? 'cm' : 'ft'}',
                      style: kSmallTextStyle,
                    )
                  ],
                ),
                Flexible(
                  //TODO: always wrap this when using a scrollable widget
                  child: VerticalWeightSlider(
                    height: 450,
                    controller: _controller,
                    maxWeight: 250,
                    config: PointerConfig(
                      colors: [
                        Colors.grey[700],
                        Colors.grey[500],
                        Colors.grey[200],
                      ],
                    ),
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
