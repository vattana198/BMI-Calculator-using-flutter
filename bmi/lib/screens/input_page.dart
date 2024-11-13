import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/reusable_card.dart';
import '../component/icon_content.dart';
import '../constancts.dart';
import 'result_pages.dart'; 
import '../component/round_icon_button.dart';
import '../component/button.dart';
import '../calculator_brain.dart'; 

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 180;
int weight = 50; 
int age = 18;
enum ColorType {
    Activationcolor,
    InactiveColor,
}
enum Gender{
    Male,
    Female
}
  

class _InputPageState extends State<InputPage> {
  ColorType  maleCardColor = ColorType.InactiveColor;
  ColorType  FemaleCardColor = ColorType.InactiveColor;

  bool isMale = true;
  bool isFemale = false;

  ColorType getColorType(){
    return isMale ? ColorType.Activationcolor :  ColorType.InactiveColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    onPress: (){
                      setState(() {
                        isMale = true;
                        isFemale = false;
                      });
                    },
                    cardChild: IconWidget(icon: FontAwesomeIcons.mars, label: 'Male',),
                    colour: isMale ? activationColor  : inactiveColor,
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    onPress: (){
                        setState(() {
                          isMale = false;
                          isFemale = true;
                        });
                    },
                    cardChild: IconWidget(icon: FontAwesomeIcons.venus, label: 'Female',),
                    colour: isFemale ? activationColor : inactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUsableCard(
              colour: activationColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,

                children:[
                  Text('Height', style: labelTextStyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text( height.toString(), style: bmiTextStyle),
                      Text('cm' , style: labelTextStyle),
                    ],
                  ),
                  
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max:220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor:Color(0xFF8D8E98),
                      onChanged:(double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    colour: activationColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text('Weight' , style: labelTextStyle,),
                        Text(weight.toString() , style: bmiTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                               
                            ),

                            SizedBox(width: 10.0, height: 10.0,),

                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    colour: activationColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text('Age' , style: labelTextStyle,),
                        Text(age.toString() , style: bmiTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                               
                            ),

                            SizedBox(width: 10.0, height: 10.0,),

                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
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
            onTap: (){
              CalculatorBrain cal = CalculatorBrain(height: height , weight :weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPages(
                bmiResult: cal.calculateBMI(),
                resultText: cal.getResult(),
                Interpretation: cal.getInterpretation(),
              )));
              


            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

