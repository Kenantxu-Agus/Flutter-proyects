import 'package:bmi_calculator/components/navigator_button.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../input_viewmodel.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.viewModel}) : super(key: key);
  final InputViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: kBmiColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Expanded(
              child: Center(
                child: Text(
                  'Your result',
                  style: kResultsLabelStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: kStartColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      viewModel.getResult(),
                      style: kResultStyle,
                    ),
                    Text(
                      viewModel.calculateBMI(),
                      style: kBMITextStyle,
                    ),
                    Text(
                      viewModel.getInterpretation(),
                      style: kBMIExplication,
                    ),
                  ],
                ),
              ),
            ),
            NavigatorButton(
                text: 'RE-CALCULATE',
                onPress: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
