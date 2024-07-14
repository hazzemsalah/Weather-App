class WeatherModel {
  final String cityname;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String status;

  WeatherModel(
      {required this.cityname,
      required this.date,
      this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.status});
  factory WeatherModel.fromJson(json){
    return WeatherModel(
      cityname: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]), 
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"], 
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"], 
      status: json["forecast"]["forecastday"][0]["day"]["condition"]["text"]
      );
  }
}
