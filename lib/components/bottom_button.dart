import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.text});
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomContainerHeight,
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 5.0),
        color: kActiveCardColour,
        child: Center(
          child: Text(
            text,
            style: kLargeTextStyle,
          ),
        ),
      ),
    );
  }
}
