class ChangeModel {
  String selectedCoin;
  String selectedCoinBase;
  double coinValue;
  double btcValue = 0.0;
  double ethValue = 0.0;
  double ltcValue = 0.0;

  ChangeModel({
    required this.selectedCoin,
    required this.selectedCoinBase,
    required this.coinValue,
  });

  factory ChangeModel.fromJson(Map<String, dynamic> json) {
    String selectedCoinBase = json['asset_id_base'];
    String selectedCoin = json['asset_id_quote'];
    double coinValue = json['rate'];

    return ChangeModel(
      selectedCoin: selectedCoin,
      selectedCoinBase: selectedCoinBase,
      coinValue: coinValue,
    );
  }
}
