import 'package:flutter/material.dart';

import '../common/constants.dart';

class LineComponent extends StatelessWidget {
  final Color colour;
  final VoidCallback? onPress;
  final Widget child;

  const LineComponent(
      {Key? key, required this.colour, this.onPress, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextButton(
          onPressed: onPress,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(kLineSelectColor),
          ),
          child: child,
        ),
      ),
    );
  }
}
