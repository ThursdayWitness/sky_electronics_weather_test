import 'package:flutter/material.dart';
import 'package:sky_electronics_weather_test/presentation/text_styles.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "🌡$temperature°C",
            style: titleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Ощущается как: $feelsLike°C",
            style: subtitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(weatherDescription.capitalize()),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("༄ Ветер: $windSpeedм/с"),
        ),
      ],
    );
  }
}
