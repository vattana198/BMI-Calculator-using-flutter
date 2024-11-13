import 'package:bmi/component/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constancts.dart';
import '../component/button.dart';


class ResultPages extends StatelessWidget {

  ResultPages({required this.bmiResult , required this.resultText , required this.Interpretation});

  final String bmiResult;
  final String resultText;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: resultTextStyle,
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: ReUsableCard(
              colour: activationColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: <Widget>[
                Text(resultText , style: resultTypeStyle,),
                Text(bmiResult ,style: resultNumberStyle,),
                Text(Interpretation, 
                style: resultBodyStyle, textAlign: TextAlign.center,),
              ],
              ),
            ),
          ),
          BottomButton(
            onTap: (){
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }



}