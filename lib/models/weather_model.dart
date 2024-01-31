class WeatherModel {
  final String cityName;
  final num avgTemp;
  final num minTemp;
  final num maxTemp;
  final String weatherCondition;
  final String icon;

  WeatherModel(
      {required this.cityName,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition,
      required this.icon});

  factory WeatherModel.fromJson(Map map) {
    return WeatherModel(
      cityName: map["location"]["name"],
      avgTemp: map["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      minTemp: map["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxTemp: map["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      weatherCondition: map["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      icon: map["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
    );
  }
}
