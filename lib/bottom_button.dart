import 'package:flutter/material.dart';
import 'constant.dart';

class Bottom_Button extends StatelessWidget {
  Bottom_Button(this.ontapfunc, this.margin_widget, this.text, this.icon);

  final void Function()? ontapfunc;
  final EdgeInsets margin_widget;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapfunc,
      child: Container(
        decoration: BoxDecoration(
          gradient: kFemaleGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: margin_widget,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: kAppBarTextStyle,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
