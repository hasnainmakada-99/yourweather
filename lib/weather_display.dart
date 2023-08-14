import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherDisplay extends ConsumerWidget {
  final String placeName;
  final String date;
  final String temp;
  final String sunrise;
  final String weatherIcon;

  WeatherDisplay({
    required this.placeName,
    required this.date,
    required this.temp,
    required this.sunrise,
    required this.weatherIcon,
  });

  Future<String> getSunnyPicture() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return 'https://w7.pngwing.com/pngs/540/96/png-transparent-clouds-sunny-warm-patches-weather-partly-cloudy-symbols-forecast.png';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Place: ${placeName ?? ''}'),
                  Text('Date: ${date ?? ''}'),
                  Text('Temperature: ${temp ?? ''}'),
                  Text('Sunrise: ${sunrise ?? ''}'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.network(
                  'https://w7.pngwing.com/pngs/540/96/png-transparent-clouds-sunny-warm-patches-weather-partly-cloudy-symbols-forecast.png'),
            ),
          ],
        ),
      ],
    );
  }
}
