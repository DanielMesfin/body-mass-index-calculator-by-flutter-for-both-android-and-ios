import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constant.dart';
import 'result_page.dart';

//TODO ; CRATE THE ENUM TYPED GENDER IN THE PROJECT  TO HOLD THE SELECTED VALUE;
enum Gender { meal, female, nether }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //TODO : Initialization is required for the variable declaration at these version;
  Gender selectedGender = Gender.nether;
  int height = 180;
  int wight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.meal;
                      });
                    },
                    newColor: selectedGender == Gender.meal
                        ? activeColor
                        : inactiveColor,
                    cardChild: Icon_card(
                      label: 'MALE',
                      inconData: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    newColor: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    cardChild: Icon_card(
                      label: 'FEMALE',
                      inconData: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              newColor: applicationThem,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberText),
                      Text(
                        'CM',
                        style: textStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x30EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0xFF8E8D80),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    newColor: applicationThem,
                    cardChild: BottomCards(
                      onpress: () {
                        setState(() {
                          wight++;
                        });
                      },
                      decriment: () {
                        setState(() {
                          wight--;
                        });
                      },
                      cardLabel: 'WIGHT',
                      wight: wight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    newColor: applicationThem,
                    cardChild: BottomCards(
                      onpress: () {
                        setState(() {
                          age++;
                        });
                      },
                      decriment: () {
                        setState(() {
                          age--;
                        });
                      },
                      cardLabel: 'AGE',
                      wight: age,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(wight,height),
                ),
              );
              //TODO  this is for the complement of
              // print(age);
              // print(wight);
              // print(height);
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULAT',
                  style: textStyle,
                ),
              ),
              margin: const EdgeInsets.only(top: 8.0),
              color: const Color(0xFFEB1555),
              height: bottomNavigationColor,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

class BottomCards extends StatelessWidget {
  final String cardLabel;
  final int wight;
  final Function()? onpress;
  final Function()? decriment;
  BottomCards(
      {required this.cardLabel,
      required this.wight,
      this.onpress,
      this.decriment});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          cardLabel,
          style: textStyle,
        ),
        Text(
          wight.toString(),
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: onpress,
              child: Icon(
                Icons.add,
                size: 20.0,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            FloatingActionButton(
              onPressed: decriment,
              child: Icon(
                Icons.exposure_neg_1,
                size: 20.0,
                color: Colors.red,
              ),
            )
          ],
        )
      ],
    );
  }
}
