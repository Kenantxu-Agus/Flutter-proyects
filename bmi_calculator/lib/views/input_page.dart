import 'package:bmi_calculator/input_viewmodel.dart';
import 'package:bmi_calculator/views/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/constants.dart';
import '../common/enums.dart';
import '../components/custom_icon_button.dart';
import '../components/custom_number_button.dart';
import '../components/line_component.dart';
import '../components/navigator_button.dart';
import '../components/slider_button.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  InputViewModel viewModel =
      InputViewModel(height: 170, weight: 85, age: 25, gender: Gender.none);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: kBmiColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  LineComponent(
                    onPress: () {
                      setState(() {
                        viewModel.gender = Gender.male;
                        //print('gender male was selected');
                      });
                    },
                    colour: viewModel.gender == Gender.male
                        ? kSelectedColor
                        : kInactiveColor,
                    child: CustomIconButton(
                        icon: FontAwesomeIcons.mars, text: 'Male'),
                  ),
                  LineComponent(
                    onPress: () {
                      setState(() {
                        viewModel.gender = Gender.female;
                        //print('gender female was selected');
                      });
                    },
                    colour: viewModel.gender == Gender.female
                        ? kSelectedColor
                        : kInactiveColor,
                    child: CustomIconButton(
                        icon: FontAwesomeIcons.venus, text: 'Female'),
                  ),
                ],
              ),
            ),
            LineComponent(
              colour: kStartColor,
              child: SliderButton(
                heightValue: viewModel.height,
                sliderChanged: (double value) {
                  setState(() {
                    viewModel.height = value.toInt();
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  LineComponent(
                    colour: kStartColor,
                    child: CustomNumberButton(
                      buttonText: 'WEIGHT',
                      initialNumber: viewModel.weight,
                      decrement: () {
                        setState(() {
                          viewModel.weight--;
                        });
                      },
                      increment: () {
                        setState(() {
                          viewModel.weight++;
                        });
                      },
                    ),
                  ),
                  LineComponent(
                    colour: kStartColor,
                    child: CustomNumberButton(
                      buttonText: 'AGE',
                      initialNumber: viewModel.age,
                      decrement: () {
                        setState(() {
                          viewModel.age--;
                        });
                      },
                      increment: () {
                        setState(() {
                          viewModel.age++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            NavigatorButton(
              text: 'CALCULATE',
              onPress: () {
                viewModel.calculate();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultsPage(viewModel: viewModel)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
