class WeatherModel {
  final String cityName;
  final int temperature;
  final int condition;
  final String description;

  WeatherModel(
      {this.cityName, this.temperature, this.condition, this.description});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    int temperature = json['main']['temp'].toInt();
    int condition = json['weather'][0]['id'];
    String description = json['weather'][0]['description'];
    String cityName = json['name'];
    return WeatherModel(
        cityName: cityName,
        temperature: temperature,
        condition: condition,
        description: description);
  }
  @override
  String toString() {
    return 'la temperatura de $cityName es $temperature en un clima de $condition con $description';
  }
}
