import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatefulWidget {
  RoundIconButton({@required this.iconData, @required this.onPress});
  final IconData iconData;
  final Function onPress;

  @override
  _RoundIconButtonState createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(widget.iconData),
      onPressed: widget.onPress,
      elevation: 100.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0,
      ),
      fillColor: kActiveCardColour,
    );
  }
}
