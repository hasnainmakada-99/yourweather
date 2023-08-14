import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  final String place_name;
  final String date;
  final String temp;
  final String sunrise;
  final String weatherIcon;
  WeatherModel(
      {
      // ignore: non_constant_identifier_names
      required this.place_name,
      required this.date,
      required this.temp,
      required this.sunrise,
      required this.weatherIcon});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'temp': temp,
      'sunrise': sunrise,
      'place': place_name,
      'weather_icon': weatherIcon,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      date: map['Date'] as String,
      temp: map['Temp'] as String,
      sunrise: map['Sunrise'] as String,
      place_name: map['Place Name'] as String,
      weatherIcon: map['weatherIcon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
