import 'package:flutter/material.dart';

import '../common/constants.dart';

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kCalculateStyle,
          ),
        ),
        color: kButtomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kContainerHeight,
      ),
    );
  }
}
