import 'package:bmi_new_theme/Screens/Result_Page.dart';
import 'package:bmi_new_theme/Screens/welcomeScreen.dart';
import 'package:bmi_new_theme/bottom_button.dart';
import 'package:bmi_new_theme/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_new_theme/verticle_weight_slider/vertical_weight_slider.dart';
import 'package:bmi_new_theme/scalesWidget_cm_ft.dart';
import 'package:bmi_new_theme/height_page_unit_button.dart';

import '../calculator_brain.dart';

enum unit { cm, ft, m }
unit uni = unit.cm;

class HeightSelector extends StatefulWidget {
  HeightSelector(
      {@required this.weight = 0,
      @required this.age = 0,
      @required this.gen = gender.t});
  final gender gen;
  final int weight;
  final int age;

  @override
  _HeightSelectorState createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double _height = 170;
  int _minHeight = 100;

  late WeightSliderController _controller;

  void height_convertor() {
    if (uni == unit.ft) {
      int inch;
      inch = 12 * FeetScale.feet + FeetScale.inch;
      _height = 2.54 * inch;
    }
  }

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
      body: ListView(
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
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                color: kBoxColor,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 80),
              padding: EdgeInsets.only(right: 10, top: 6, bottom: 6, left: 18),
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
          Bottom_Button(() {
            height_convertor();
            print(_height);
            print(widget.weight);
            Brain brain = Brain(
              weight: widget.weight,
              height: _height,
              age: widget.age,
              gen: widget.gen,
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(
                weight: widget.weight,
                height: _height.toInt(),
                bmi: brain.bmivalue(),
                status: brain.status(),
                age: widget.age,
                bodyFat: brain.body_fat(),
                // minweight: brain.min_weight(),
                // maxweight: brain.max_weight(),
              );
            }));
          }, EdgeInsets.only(left: 110, right: 110, bottom: 50), 'Calculate',
              Icon(Icons.arrow_forward))
        ],
      ),
    ));
  }
}
