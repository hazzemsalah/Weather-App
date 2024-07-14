import 'package:_6_weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "0ae70f98c39d4f0e8fd125656242805%20";

  WeatherService({required this.dio});
  Future<WeatherModel> GetWeather({required cityname}) async {
    try {
      Response response = await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data["error"]["message"] ?? "opps , there's an error";
      throw Exception(errMessage);
    }
  }
}
