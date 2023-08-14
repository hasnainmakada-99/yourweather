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
      debugShowCheckedModeBanner: false,
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
  String weatherIcon = '';

  void search(String cityname) async {
    final weather = ref.watch(weatherProvider);
    final weatherStats = await weather.getWeatherbyCityName(cityname);
    placeName = weatherStats.place_name;
    temp = weatherStats.temp;
    date = weatherStats.date;
    sunriseTime = weatherStats.sunrise;
    weatherIcon = weatherStats.weatherIcon;
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => search(value),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white, // Set the cursor color
          decoration: InputDecoration(
            hintText: 'Enter Your City Name and press enter...',
            hintStyle: const TextStyle(
              color: Colors.white, // Set the hint text color
            ),
            fillColor: const Color.fromARGB(
                255, 148, 137, 137), // Set the background color
            filled: true, // Ensure the background is filled
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[400], // Set the icon color
            ),
            border: OutlineInputBorder(
              // Add a border
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: WeatherDisplay(
                placeName: placeName,
                date: date,
                temp: temp,
                sunrise: sunriseTime,
                weatherIcon: weatherIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
