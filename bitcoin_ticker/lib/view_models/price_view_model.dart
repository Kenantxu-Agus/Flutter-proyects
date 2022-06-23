import 'dart:core';

import 'package:bitcoin_ticker/models/change_model.dart';

import '../services/networking_service.dart';
import '../utilities/constants.dart';

class PriceViewModel {
  ChangeModel _change = ChangeModel(
    selectedCoinBase: 'USD',
    selectedCoin: 'GBP',
    coinValue: 0.0,
  );

  Future<double> getChanges() async {
    _change = await NetworkingService.getChanges(
        _change.selectedCoinBase, _change.selectedCoin);
    _change.btcValue = await getBtcValue();
    _change.ethValue = await getEthValue();
    _change.ltcValue = await getLtcValue();
    return _change.coinValue;
  }

  void setSelectedCoin(String value) {
    _change.selectedCoin = value;
  }

  void setSelectedCoinBase(String value) {
    _change.selectedCoinBase = value;
  }

  void setSelectedCoinName(int index) {
    _change.selectedCoin = listOfCoins().elementAt(index);
  }

  void setSelectedCoinBaseName(int index) {
    _change.selectedCoinBase = listOfCoins().elementAt(index);
  }

  String getSelectedCoin() {
    return _change.selectedCoin;
  }

  String getSelectedCoinBase() {
    return _change.selectedCoinBase;
  }

  double getCoinValue() {
    return _change.coinValue;
  }

  Future<double> getBtcValue() async {
    ChangeModel btc =
        await NetworkingService.getChanges('BTC', _change.selectedCoin);
    return btc.coinValue;
  }

  Future<double> getEthValue() async {
    ChangeModel eth =
        await NetworkingService.getChanges('ETH', _change.selectedCoin);
    return eth.coinValue;
  }

  Future<double> getLtcValue() async {
    ChangeModel ltc =
        await NetworkingService.getChanges('LTC', _change.selectedCoin);
    return ltc.coinValue;
  }

  double getBtc() {
    return _change.btcValue;
  }

  double getEth() {
    return _change.ethValue;
  }

  double getLtc() {
    return _change.ltcValue;
  }

  List<String> listOfCoins() {
    return currenciesList;
  }
}
