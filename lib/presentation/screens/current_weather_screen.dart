import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/api/api_controller.dart';
import 'package:sky_electronics_weather_test/presentation/error_dialog.dart';
import 'package:sky_electronics_weather_test/presentation/text_styles.dart';
import 'package:sky_electronics_weather_test/presentation/weather_card.dart';

class CurrentWeatherScreen extends StatelessWidget {
  final String cityName;
  final Map<dynamic, dynamic> currentWeather;

  const CurrentWeatherScreen(
      {super.key, required this.cityName, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    // В идеале, здесь и в forecast_screen я бы реализовал через класс модели с помощью freezed.
    // Но автоматическая десериализация json'а провоцирует кучу ошибок из-за класса _JsonMap,
    // потому решил оставить текущий вариант.
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
                    windSpeed: wind["speed"]),
                ElevatedButton(
                    onPressed: () async {
                      final forecast = await getForecast(cityName);
                      if (context.mounted) {
                        if (forecast != null) {
                          context
                              .push('/forecast', extra: [cityName, forecast]);
                        } else {
                          showErrorDialog(context);
                        }
                      }
                    },
                    child: const Text("Узнать прогноз на следующие 3 дня"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
