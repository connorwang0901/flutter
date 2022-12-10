import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  final int weight;
  final int height;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25) {
      return 'OVERWEIGHT';
    }else if(_bmi > 18.5) {
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String getInterpration() {
    if(_bmi >= 25) {
      return 'If your BMI is greater than 25, it falls within the overweight or even obesity range';
    }else if(_bmi > 18.5) {
      return 'If your BMI is 18.5 to <25, it falls within the healthy weight range';
    }else{
      return 'If your BMI is less than 18.5, it falls within the underweight range';
    }
  }
}