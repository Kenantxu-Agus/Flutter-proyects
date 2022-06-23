import 'package:bmi_calculator/common/constants.dart';
import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final int heightValue;
  final ValueChanged<double> sliderChanged;
  SliderButton(
      {Key? key, required this.heightValue, required this.sliderChanged})
      : super(key: key);

  @override
  _SliderState createState() => _SliderState();

  int getHeight() {
    return heightValue;
  }
}

class _SliderState extends State<SliderButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('HEIGHT', style: kLabelStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              widget.heightValue.toString(),
              style: kHeightNumberLabelStyle,
            ),
            Text('cm', style: kLabelStyle),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            thumbColor: kButtomContainerColor,
            overlayColor: kSliderSelectedColor,
            activeTrackColor: kLineSelectColor,
            inactiveTrackColor: kIconTextColor,
          ),
          child: Slider(
            value: widget.heightValue.toDouble(),
            min: kMinSlider,
            max: kMaxSlider,
            onChanged: widget.sliderChanged,
          ),
        ),
      ],
    );
  }
}
