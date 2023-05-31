import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
// API : 339f5e45b77296b7ca0075e5b34698b3

class WeatherModal {
  String? base;
  int? visibility;
  int? dt;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherModal({
    this.base,
    this.visibility,
    this.dt,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherModal.fromJson(Map<String, dynamic> json) {
    return WeatherModal(
      base: json['base'],
      cod: json['cod'],
      dt: json['dt'],
      id: json['id'],
      name: json['name'],
      timezone: json['timezone'],
    );
  }

  Future<WeatherModal?> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=339f5e45b77296b7ca0075e5b34698b3'));

    if (response.statusCode == 200) {
      try {
        final json = jsonDecode(response.body);
        return WeatherModal.fromJson(json);
      } catch (e) {
        log('error occurred');
      }
    } else {
      return null;
    }
  }
}

final weatherProvider = FutureProvider<WeatherModal?>((ref) async {
  WeatherModal weatherModal = WeatherModal();
  return weatherModal.fetchData();
});
