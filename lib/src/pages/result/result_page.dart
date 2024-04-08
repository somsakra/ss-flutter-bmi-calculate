import 'package:bmi_calculator/src/methods/styles.dart';
import 'package:bmi_calculator/src/provider/theme_provider.dart';
import 'package:bmi_calculator/src/widgets/bottom_button.dart';
import 'package:bmi_calculator/src/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

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
          title: const Text('BMI CALCULATOR'),
          titleTextStyle: buildLabelTextStyle(context)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: Theme.of(context).colorScheme.primary,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).colorScheme.onPrimary),
                    )
                  ],
                ),
              )),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
