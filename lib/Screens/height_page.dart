import 'package:bmi_new_theme/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_new_theme/verticle_weight_slider/vertical_weight_slider.dart';
import 'package:bmi_new_theme/scalesWidget_cm_ft.dart';
import 'package:bmi_new_theme/height_page_unit_button.dart';

enum unit { cm, ft, m }
unit uni = unit.cm;

class HeightSelector extends StatefulWidget {
  @override
  _HeightSelectorState createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double _height = 170;
  int _minHeight = 100;
  late WeightSliderController _controller;

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
                  UnitContainer(unit.cm, () {
                    setState(() {
                      uni = unit.cm;
                    });
                  }, 'cm'),
                  SizedBox(
                    width: 10,
                  ),
                  UnitContainer(unit.ft, () {
                    setState(() {
                      uni = unit.ft;
                    });
                  }, 'ft')
                ],
              ),
            ),
          ),
          uni == unit.cm
              ? CentimeterScale('${_height.toInt()}', (double value) {
                  setState(() {
                    _height = value;
                  });
                }, _controller)
              : FeetScale(),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Calculate',
                    style: kAppBarTextStyle,
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: kMaleGradient,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.only(left: 110, right: 110, bottom: 50),
            ),
          ),
        ],
      ),
    ));
  }
}
