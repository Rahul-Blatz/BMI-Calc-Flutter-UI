import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final String content;
  final IconData iconContent;

  IconContent({@required this.iconContent, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconContent,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          content,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
