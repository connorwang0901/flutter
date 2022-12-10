import 'package:bmi_calculator/style_constants.dart';
import 'package:flutter/material.dart';

class ReusableCardChild extends StatelessWidget {
  ReusableCardChild(@required this.icon, this.text);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(text, style: kstyle
        ),
      ],
    );
  }
}


