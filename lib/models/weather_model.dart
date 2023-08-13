import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  final String place_name;
  final String date;
  final String temp;
  final String sunrise;
  WeatherModel({
    // ignore: non_constant_identifier_names
    required this.place_name,
    required this.date,
    required this.temp,
    required this.sunrise,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'temp': temp,
      'sunrise': sunrise,
      'place': place_name,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      date: map['Date'] as String,
      temp: map['Temp'] as String,
      sunrise: map['Sunrise'] as String,
      place_name: map['Place Name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.place_name == place_name &&
        other.date == date &&
        other.temp == temp &&
        other.sunrise == sunrise;
  }

  @override
  int get hashCode {
    return place_name.hashCode ^
        date.hashCode ^
        temp.hashCode ^
        sunrise.hashCode;
  }
}
