import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/height_page.dart';
import 'constant.dart';

class UnitContainer extends StatelessWidget {
  UnitContainer(this.unitValue, this.onPress, this.unitText);

  final unit unitValue;
  final Function()? onPress;
  final String unitText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: uni == unitValue ? kUnitGradient : null,
          borderRadius: BorderRadius.circular(12)),
      child: RawMaterialButton(
        onPressed: onPress,
        child: Text(
          unitText,
          style: kUnitTextStyle,
        ),
      ),
    );
  }
}
