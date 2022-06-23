import 'package:flutter/material.dart';

class CrytoCard extends StatefulWidget {
  final String cryptoName;
  final String coinName;
  final String coinValue;
  CrytoCard(
      {Key? key,
      required this.cryptoName,
      required this.coinName,
      required this.coinValue})
      : super(key: key);

  @override
  _CryptoState createState() => _CryptoState();
}

class _CryptoState extends State<CrytoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.cryptoName} = ${widget.coinValue} ${widget.coinName}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
