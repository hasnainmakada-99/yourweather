import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/models/weather_model.dart';

final weatherProvider = Provider((ref) => WeatherModelFactory());

class WeatherModelFactory {
  WeatherFactory wf = WeatherFactory(
    '27d6af55617f1f4431e5852064de2768',
    language: Language.ENGLISH,
  );

  Future<WeatherModel> getWeatherbyCityName(String cityname) async {
    Weather w;
    try {
      w = await wf.currentWeatherByCityName(cityname);

      WeatherModel weatherModel = WeatherModel(
        place_name: w.country.toString(),
        date: w.date.toString(),
        temp: w.temperature.toString(),
        sunrise: w.sunrise.toString(),
      );

      return weatherModel;
    } catch (e) {
      return WeatherModel(
        place_name: 'Error',
        date: '',
        temp: '',
        sunrise: '',
      );
    }
  }
}
