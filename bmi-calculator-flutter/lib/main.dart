import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0f1020),
          colorScheme: ColorScheme.light()
              .copyWith(primary: Color(0xff0f1020)),
        ),
          home: InputPage(),
        );
  }
}

