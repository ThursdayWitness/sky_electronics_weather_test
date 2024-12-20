import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/presentation/text_styles.dart';
import 'package:sky_electronics_weather_test/presentation/weather_card.dart';

class ForecastScreen extends StatelessWidget {
  final String cityName;
  final List<dynamic> forecast;

  const ForecastScreen(
      {super.key, required this.cityName, required this.forecast});

  @override
  Widget build(BuildContext context) {
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
                    "Прогноз погоды в городе $cityName:",
                    style: titleStyle,
                  ),
                ),
                Row(
                  children: [
                    for (var i = 0; i < forecast.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(forecast[i]["dt_txt"]),
                            WeatherCard(
                                temperature: forecast[i]["main"]["temp"],
                                feelsLike: forecast[i]["main"]["feels_like"],
                                weatherDescription: forecast[i]["weather"][0]
                                    ["description"],
                                windSpeed: forecast[i]["wind"]["speed"]),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
