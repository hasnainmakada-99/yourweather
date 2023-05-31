import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Weather/WeatherModal.dart';
import 'package:weather_app/WeatherScreen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final weather = ref.watch(weatherProvider);

        return weather.when(
          data: (data) {
            return WeatherScreen(modal: data);
          },
          error: (error, stackTrace) {
            return Text('Some Error Occurred $error');
          },
          loading: () {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          },
        );
      },
    );
  }
}
