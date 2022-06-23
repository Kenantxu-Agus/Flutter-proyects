import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSelector extends StatelessWidget {
  const CupertinoSelector(
      {Key? key,
      required this.onSelectedItemChanged,
      required this.onChanged,
      required this.coinsList,
      required this.valueForMaterial,
      required this.initialNumber})
      : super(key: key);
  final List<String> coinsList;
  final String valueForMaterial;
  final Function(int)? onSelectedItemChanged;
  final Function(String?)? onChanged;
  final int initialNumber;

  static List<DropdownMenuItem<String>> createListOfCoins(List<String> coins) {
    List<DropdownMenuItem<String>> _listOfCoins = [];
    for (String coin in coins) {
      _listOfCoins.add(
        DropdownMenuItem(
          child: Center(
              child: Text(
            coin,
            style: TextStyle(color: Colors.white),
          )),
          value: coin,
        ),
      );
    }
    return _listOfCoins;
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedButton;
    if (Platform.isIOS) {
      selectedButton = CupertinoPicker(
        scrollController:
            FixedExtentScrollController(initialItem: initialNumber),
        useMagnifier: true,
        magnification: 1.1,
        itemExtent: 32.0,
        onSelectedItemChanged: onSelectedItemChanged,
        children: createListOfCoins(coinsList),
      );
    } else {
      selectedButton = DropdownButton<String>(
        value: valueForMaterial,
        items: createListOfCoins(coinsList),
        onChanged: onChanged,
      );
    }
    return selectedButton;
  }
}
