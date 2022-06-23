import 'package:bitcoin_ticker/components/crypto_card.dart';
import 'package:bitcoin_ticker/view_models/price_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/cupertino_selector.dart';
import '../view_models/price_view_model.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  PriceViewModel viewModel = PriceViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CrytoCard(
            cryptoName: 'BTC',
            coinName: viewModel.getSelectedCoin(),
            coinValue: viewModel.getBtc().toStringAsFixed(3),
          ),
          CrytoCard(
            cryptoName: 'ETH',
            coinName: viewModel.getSelectedCoin(),
            coinValue: viewModel.getEth().toStringAsFixed(3),
          ),
          CrytoCard(
            cryptoName: 'LTC',
            coinName: viewModel.getSelectedCoin(),
            coinValue: viewModel.getLtc().toStringAsFixed(3),
          ),
          CrytoCard(
            cryptoName: viewModel.getSelectedCoinBase(),
            coinName: viewModel.getSelectedCoin(),
            coinValue: viewModel.getCoinValue().toStringAsFixed(3),
          ),
          Container(
            color: Colors.lightBlue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '   Convert:',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      'To:          ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100.0,
                      width: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 30.0),
                      color: Colors.lightBlue,
                      child: CupertinoSelector(
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            viewModel.setSelectedCoinBaseName(value);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            viewModel.setSelectedCoinBase(value!);
                          });
                        },
                        coinsList: viewModel.listOfCoins(),
                        valueForMaterial: viewModel.getSelectedCoinBase(),
                        initialNumber: 19,
                      ),
                    ),
                    Container(
                      height: 100.0,
                      width: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 30.0),
                      color: Colors.lightBlue,
                      child: CupertinoSelector(
                        onSelectedItemChanged: (int value) {
                          setState(() async {
                            viewModel.setSelectedCoinName(value);
                            await viewModel.getChanges();
                          });
                        },
                        onChanged: (value) {
                          setState(() async {
                            viewModel.setSelectedCoin(value!);
                            await viewModel.getChanges();
                          });
                        },
                        coinsList: viewModel.listOfCoins(),
                        valueForMaterial: viewModel.getSelectedCoin(),
                        initialNumber: 5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
