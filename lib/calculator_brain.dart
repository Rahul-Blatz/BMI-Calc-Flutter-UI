import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'Normal'.toUpperCase();
    } else
      return 'UnderWeight'.toLowerCase();
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Burn fat bitch!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job DumbAss!';
    } else
      return 'You have a lower than normal body weight. Eat more bitch!';
  }
}
