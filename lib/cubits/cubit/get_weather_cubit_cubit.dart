import 'package:bloc/bloc.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/services/dio_get_weather.dart';

part 'get_weather_cubit_state.dart';

class GetWeatherCubitCubit extends Cubit<WeatherStates> {
  GetWeatherCubitCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;
  getWeatherData({required String cityName}) async {
    try {
       weatherModel =
          await DioService().getWeatherData(cityName: cityName);
      emit(WeatherLoadedSuccess());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
