import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Weather/weather_provider.dart';
import 'package:weather_app/weather_display.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Open Weather Key = 27d6af55617f1f4431e5852064de2768

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String placeName = '';
  String temp = '';
  String sunriseTime = '';
  String date = '';
  @override
  Widget build(BuildContext context) {
    final weather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
            onPressed: () async {
              final weatherofcity = await weather.getWeatherbyCityName(
                "Bhavnagar",
              );
              setState(() {
                placeName = weatherofcity.place_name;
                temp = weatherofcity.temp;
                date = weatherofcity.date;
                sunriseTime = weatherofcity.sunrise;
              });
            },
            child: const Text('Click here to get weather'),
          ),
          WeatherDisplay(
            placeName: placeName,
            date: date,
            temp: temp,
            sunrise: sunriseTime,
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
