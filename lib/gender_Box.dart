import 'package:flutter/material.dart';
import 'constant.dart';

class GenderBox extends StatelessWidget {
  GenderBox(
      {this.genderImage = ' ',
      this.genderText = ' - ',
      this.gradient,
      @required this.onPress});

  String genderImage;
  String genderText;
  final LinearGradient? gradient;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: onPress,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kBoxColor,
                  gradient: gradient,
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('Assets/$genderImage'),
                    ),
                  ],
                )),
          ),
          Text(
            genderText,
            style: kSmallTextStyle,
          ),
        ],
      ),
    );
  }
}
