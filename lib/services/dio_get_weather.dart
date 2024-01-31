import 'package:dio/dio.dart';
import 'package:my_weather_app/models/weather_model.dart';

class DioService {
  final Dio dio = Dio();

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    Response response = await dio.get(
        "http://api.weatherapi.com/v1/forecast.json?key=1b0ef9a6f66a42c5ac4233804242301&q=$cityName&days=1");
    var responsebody = response.data;
    WeatherModel weatherModel = WeatherModel.fromJson(responsebody);
    print(weatherModel);
    return weatherModel;
  }
}
