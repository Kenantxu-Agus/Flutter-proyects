import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/constants.dart';

class CustomNumberButton extends StatefulWidget {
  final String buttonText;
  int initialNumber;
  final VoidCallback decrement;
  final VoidCallback increment;

  CustomNumberButton(
      {Key? key,
      required this.buttonText,
      required this.initialNumber,
      required this.decrement,
      required this.increment})
      : super(key: key);

  @override
  _NumberState createState() => _NumberState();
}

class _NumberState extends State<CustomNumberButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.buttonText,
            style: kLabelStyle,
          ),
          Text(
            widget.initialNumber.toString(),
            style: kHeightNumberLabelStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(FontAwesomeIcons.minus, color: kLineSelectColor),
                backgroundColor: kAddButtontColor,
                onPressed: widget.decrement,
                heroTag: null,
              ),
              SizedBox(
                width: 10.0,
              ),
              FloatingActionButton(
                child: Icon(FontAwesomeIcons.plus, color: kLineSelectColor),
                backgroundColor: kAddButtontColor,
                onPressed: widget.increment,
                heroTag: null,
              ),
            ],
          ),
        ]);
  }
}
