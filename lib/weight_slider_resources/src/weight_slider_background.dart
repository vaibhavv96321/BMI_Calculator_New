import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeightBackground extends StatelessWidget {
  final Widget? child;
  final double? height;
  Color color;

  WeightBackground({this.child, this.height, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: this.height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: new BorderRadius.circular(50.0),
          ),
          child: child,
        ),
        SvgPicture.asset(
          'images/arrow.svg',
          package: 'weight_slider',
          color: Colors.white,
        ),
      ],
    );
  }
}
