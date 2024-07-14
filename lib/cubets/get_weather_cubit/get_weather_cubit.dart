import 'package:_6_weather_app/cubets/get_weather_cubit/get_weather_states.dart';
import 'package:_6_weather_app/models/weather_model.dart';
import 'package:_6_weather_app/services/weather_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required cityname}) async {
    emit(WeatherLoadingState());
    try {
       weatherModel =
          await WeatherService(dio: Dio()).GetWeather(cityname: cityname);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
