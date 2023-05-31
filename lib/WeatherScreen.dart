import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Weather/WeatherModal.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherModal? modal;
  const WeatherScreen({super.key, required this.modal});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Screen'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Base: ${widget.modal?.base ?? ""}'),
              Text('Visibility: ${widget.modal?.visibility ?? ""}'),
              Text('DT: ${widget.modal?.dt ?? ""}'),
              Text('Timezone: ${widget.modal?.timezone ?? ""}'),
              Text('ID: ${widget.modal?.id ?? ""}'),
              Text('Name: ${widget.modal?.name ?? ""}'),
              Text('Code: ${widget.modal?.cod ?? ""}'),
            ],
          ),
        ));
  }
}
