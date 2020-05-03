import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import 'result_page.dart';
import '../components/reuseable_card.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Timer timer;
  int height = 180;
  int weight = 60;
  int age = 35;
  Gender genderSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        elevation: 5.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  ///Male Selection Card
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.Male;
                      });
                    },
                    cardChild: IconContent(
                      iconContent: FontAwesomeIcons.mars,
                      content: 'MALE',
                    ),
                    colour: genderSelected == Gender.Male
                        ? kActiveCardColour
                        : kInActiveCardColour,
                  ),
                ),
                Expanded(
                  ///Female Selection Card
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.Female;
                      });
                    },
                    cardChild: IconContent(
                      iconContent: FontAwesomeIcons.venus,
                      content: 'FEMALE',
                    ),
                    colour: genderSelected == Gender.Female
                        ? kActiveCardColour
                        : kInActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            ///Height Slider Container
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              '$height',
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            activeTrackColor: Colors.white,
                            thumbColor: kActiveCardColour,
                            overlayColor: Color(0x2941CD7D),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kMinimumHeight,
                            max: kMaximumHeight,
                            onChanged: (double newHeight) {
                              setState(() {
                                height = newHeight.toInt();
                              });
                            },
                            inactiveColor: Color(0xff8d8e98),
                          ),
                        ),
                      ],
                    ),
                    colour: kInActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTapDown: (TapDownDetails details) {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 100), (t) {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                });
                              },
                              onTapCancel: () {
                                timer.cancel();
                              },
                              child: RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                            ),
                            GestureDetector(
                              onTapDown: (TapDownDetails details) {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 100), (t) {
                                  setState(() {
                                    if (weight < 200) {
                                      weight++;
                                    }
                                  });
                                });
                              },
                              onTapCancel: () {
                                timer.cancel();
                              },
                              child: RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kInActiveCardColour,
                  ),
                ),
                Expanded(
                  child: MyCard(
                    colour: kInActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTapDown: (TapDownDetails details) {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (t) {
                                  setState(() {
                                    age--;
                                  });
                                });
                              },
                              onTapCancel: () {
                                timer.cancel();
                              },
                              child: RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    if (age > 5) age--;
                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                            ),
                            GestureDetector(
                              onTapDown: (TapDownDetails detail) {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (t) {
                                  setState(() {
                                    age++;
                                  });
                                });
                              },
                              onTapCancel: () {
                                timer.cancel();
                              },
                              child: RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
