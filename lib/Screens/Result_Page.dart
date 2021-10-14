import 'package:bmi_new_theme/constant.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgrounColor,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: RichText(
              text: TextSpan(style: kAppBarHeight, children: <TextSpan>[
                TextSpan(text: 'Your'),
                TextSpan(text: ' Result', style: kAppBarTextStyle),
              ]),
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'Assets/giphy.gif',
                colorBlendMode: BlendMode.dstATop,
              ),
              Center(
                  child: Text(
                'Hello',
                style: kHeightTextStyle,
              )),
            ],
          )
        ],
      ),
    ));
  }
}
