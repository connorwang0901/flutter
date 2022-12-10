import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'enum.dart';
import 'style_constants.dart';
import 'result_page.dart';
import 'calculatorBrain.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                  children: [
                    Expanded(
                        child: ReusableCard(
                          selectedGender == Gender.Male ? kBactiveCardColor : kBinactiveCardColor,
                          ReusableCardChild(FontAwesomeIcons.mars, 'Male'),
                              (){
                              setState(() {
                                selectedGender = Gender.Male;
                              });
                              },
                      )
                    ),
                    Expanded(
                        child: ReusableCard(selectedGender == Gender.Female ? kBactiveCardColor : kBinactiveCardColor,
                          ReusableCardChild(FontAwesomeIcons.venus, 'Female'),
                              (){
                            setState(() {
                              selectedGender = Gender.Female;
                            });
                          },))
                  ]
              ),
            ),
            Expanded(child:
              ReusableCard(kBinactiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height', style: kstyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: knumberStyle,),
                        Text('cm', style: kstyle)
                      ],
                    ),
                    Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.white,
                      inactiveColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffeb1555),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
                (){},)),
            Expanded(
              child: Row(
                  children: [
                    Expanded(child: ReusableCard(kBinactiveCardColor,
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text('weight', style: kstyle,),
                            Text(weight.toString(),
                              style: knumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                    func: (){
                                      setState((){
                                        weight--;
                                      });
                                    }),

                                SizedBox(
                                  width: 10.0,
                                 ),
                                RoundIconButton(
                                    icon:FontAwesomeIcons.plus,
                                    func: (){
                                      setState((){
                                        weight++;
                                      });
                                    }),
                              ]),
                          ]),
                            (){}
                    )
                    ),
                   Expanded(child: ReusableCard(kBinactiveCardColor,
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('age', style: kstyle,),
                         Text(age.toString(),
                           style: knumberStyle,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               func: (){
                                 setState((){
                                   age--;
                                 });
                               }
                             ),
                             SizedBox(
                               width: 10.0,
                             ),
                             RoundIconButton(
                                 icon:FontAwesomeIcons.plus,
                                 func: (){
                                   setState((){
                                     age++;
                                   });
                                 }),
                           ],
                         )
                       ]) ,
                            (){}))
                  ]
              ),
            ),

            SizedBox(height: 10.0,),
            GestureDetector(
              onTap: (){
                CalculatorBrain cal = CalculatorBrain(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultPage(
                  bmiResult: cal.calculateBMI(), resultText: cal.getResult(), interpration: cal.getInterpration(),
                );}));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('RESULT', style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                color: kBbottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: kBbottomContainerHeight,
              ),
            ),
          ]
      )
    );
  }


}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.func});
  final IconData icon;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 0,
      onPressed: func,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon,
        color: Colors.white,),
    );
  }
}

