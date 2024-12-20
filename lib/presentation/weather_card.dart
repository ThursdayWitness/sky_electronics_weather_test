import 'package:flutter/material.dart';
import 'package:sky_electronics_weather_test/utils/string_extensions.dart';

class WeatherCard extends StatelessWidget {
  final double temperature;
  final double feelsLike;
  final String weatherDescription;
  final double windSpeed;

  const WeatherCard(
      {super.key,
      required this.temperature,
      required this.feelsLike,
      required this.weatherDescription,
      required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("🌡 Температура:"),
            Text("$temperature°C"),
          ],
        ),
        Row(
          children: [
            const Text("Ощущается как:"),
            Text("$feelsLike°C"),
          ],
        ),
        Row(
          children: [
            // Text("${weather["icon"]}"),
            Text(weatherDescription),
          ],
        ),
        Row(
          children: [
            const Text("༄ Ветер:"),
            Text("$windSpeedм/с"),
          ],
        ),
      ],
    );
  }
}
