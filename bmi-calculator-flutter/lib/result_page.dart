import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'enum.dart';
import 'style_constants.dart';



class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpration});
  final String bmiResult;
  final String resultText;
  final String interpration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your  Result',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white,
                    )
                ),
              ),
              Expanded(
                flex: 5,
                child: ReusableCard(kBinactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(resultText,style:
                        TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        ),
                        Text(bmiResult, style: knumberStyle,),
                        Padding(padding: EdgeInsets.all(15.0),
                            child: Text(interpration,
                              style: kstyle,textAlign: TextAlign.center,))
                      ],
                    ), (){}),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('RE-CALCULATE', style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  color: kBbottomContainerColor,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: kBbottomContainerHeight,
                ),
              )
            ]
        )
    );
  }
}

