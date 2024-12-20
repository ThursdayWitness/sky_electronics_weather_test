import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/weather_card.dart';

class ForecastScreen extends StatelessWidget {
  final String cityName;
  final List<dynamic> forecast;

  const ForecastScreen(
      {super.key, required this.cityName, required this.forecast});

  @override
  Widget build(BuildContext context) {
    //Городнейм
    // темпа
    // облачность
    // влажность
    // осадки?
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
            Column(
              children: [
                Text("Прогноз погоды в городе $cityName:"),
                for (var i = 0; i < forecast.length; i++)
                  Column(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
