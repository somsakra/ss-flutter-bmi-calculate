import 'package:bmi_calculator/src/functions/calculator_brain.dart';
import 'package:bmi_calculator/src/methods/styles.dart';
import 'package:bmi_calculator/src/pages/result/result_page.dart';
import 'package:bmi_calculator/src/provider/theme_provider.dart';
import 'package:bmi_calculator/src/widgets/bottom_button.dart';
import 'package:bmi_calculator/src/widgets/icon_content.dart';
import 'package:bmi_calculator/src/widgets/reusable_card.dart';
import 'package:bmi_calculator/src/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender = Gender.male;
  int height = 180;
  int weight = 65;
  int age = 25;

  selectGender(Gender selectedGender) {
    gender = selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Switch(value: context.watch<ThemeProvider>().isDark, onChanged: (newValue){
          context.read<ThemeProvider>().toggleTheme(value: newValue);
        })],
          backgroundColor: Theme.of(context).colorScheme.primary,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          title: Text(widget.title),
          titleTextStyle: buildLabelTextStyle(context)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectGender(Gender.male);
                  });
                },
                colour: gender == Gender.male
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.inversePrimary,
                cardChild: const IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: "MALE",
                ),
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectGender(Gender.female);
                  });
                },
                colour: gender == Gender.female
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.inversePrimary,
                cardChild: const IconContent(
                    icon: FontAwesomeIcons.venus, label: 'FEMALE'),
              ))
            ],
          )),
          Expanded(
              child: ReusableCard(
            colour: Theme.of(context).colorScheme.primary,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: buildLabelTextStyle(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: buildNumberTextStyle(context),
                    ),
                    Text(
                      'cm',
                      style: buildLabelTextStyle(context),
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 24.0)),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 120,
                    max: 220,
                    activeColor: Theme.of(context).colorScheme.onPrimary,
                    inactiveColor: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: buildLabelTextStyle(context),
                    ),
                    Text(
                      weight.toString(),
                      style: buildNumberTextStyle(context),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RoundIconButton(
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                          icon: FontAwesomeIcons.minus),
                      const SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          icon: FontAwesomeIcons.plus)
                    ])
                  ],
                ),
                colour: Theme.of(context).colorScheme.primary,
              )),
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: buildLabelTextStyle(context),
                    ),
                    Text(
                      age.toString(),
                      style: buildNumberTextStyle(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus)
                      ],
                    )
                  ],
                ),
                colour: Theme.of(context).colorScheme.primary,
              ))
            ],
          )),
          BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
              buttonTitle: 'CALCULATE')
        ],
      ),
    );
  }
}
