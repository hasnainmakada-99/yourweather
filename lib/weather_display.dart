import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final String placeName;
  final String date;
  final String temp;
  final String sunrise;
  final VoidCallback onPressed;

  WeatherDisplay({
    required this.placeName,
    required this.date,
    required this.temp,
    required this.sunrise,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Place: $placeName'),
        Text('Date: $date'),
        Text('Temperature: $temp'),
        Text('Sunrise: $sunrise'),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Get Weather'),
        ),
      ],
    );
  }
}
