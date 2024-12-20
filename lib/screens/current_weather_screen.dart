import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/presentation/text_styles.dart';
import 'package:sky_electronics_weather_test/presentation/weather_card.dart';

class CurrentWeatherScreen extends StatelessWidget {
  final String cityName;
  final Map<dynamic, dynamic> currentWeather;

  const CurrentWeatherScreen(
      {super.key, required this.cityName, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    final main = currentWeather["main"];
    final weather = currentWeather["weather"][0];
    final wind = currentWeather["wind"];

    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Текущая погода в городе $cityName:",
                    style: titleStyle,
                  ),
                ),
                WeatherCard(
                    temperature: main["temp"],
                    feelsLike: main["feels_like"],
                    weatherDescription: weather["description"],
                    windSpeed: wind["speed"])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
