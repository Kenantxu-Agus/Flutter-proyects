import 'dart:math';

import 'common/enums.dart';

class InputViewModel {
  int height;
  int weight;
  int age;
  Gender gender;
  double _bmi = 0.0;

  InputViewModel(
      {required this.height,
      required this.weight,
      required this.age,
      required this.gender});

  int getHeight() {
    return height;
  }

  int getWeight() {
    return weight;
  }

  void setHeight(int h) {
    height = h;
  }

  void setWeight(int w) {
    weight = w;
  }

  void calculate() {
    _bmi = weight / pow(height / 100, 2);
  }

  String calculateBMI() {
    //_bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    String bmiResult;
    if (_bmi >= 25) {
      bmiResult = 'Overweight';
    } else if (_bmi > 18.5) {
      bmiResult = 'Normal';
    } else {
      bmiResult = 'Underweight';
    }
    return bmiResult;
  }

  String getInterpretation() {
    String bmiInterpretation;
    if (_bmi >= 25) {
      bmiInterpretation =
          'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      bmiInterpretation = 'You have a normal weight. Good job!';
    } else {
      bmiInterpretation =
          'You have a lower than normal body weight. You can eat a bit more';
    }
    return bmiInterpretation;
  }
}
