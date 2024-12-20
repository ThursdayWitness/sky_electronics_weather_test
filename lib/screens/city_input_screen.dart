import 'package:flutter/material.dart';
import 'package:sky_electronics_weather_test/api_controller.dart';
import 'package:sky_electronics_weather_test/screens/current_weather_screen.dart';
import 'package:sky_electronics_weather_test/screens/forecast_screen.dart';

class CityInputScreen extends StatelessWidget {
  const CityInputScreen({super.key});

  void showErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: AlertDialog(
                title: const Text("Ошибка"),
                content: const Text(
                    "Не удалось получить погоду для выбранного города."),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Ок"),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final cityNameController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: cityNameController,
                      // decoration:
                      //     const InputDecoration(hintText: "Узнать погоду на сегодня:"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final currentWeather =
                          await getCurrentWeather(cityNameController.text);
                      if (currentWeather != null) {
                        //TODO: change navigation to GoRouter:
                        //1: add model class for Forecast
                        //2: jsonOperations on model class
                        //3: pass json in params, decode in page
                        //OR use provider
                        // context.go('/');
                        navigator.push(
                          MaterialPageRoute(
                            builder: (context) => CurrentWeatherScreen(
                                cityName: cityNameController.text,
                                currentWeather: currentWeather),
                          ),
                        );
                      } else {
                        if (context.mounted) {
                          showErrorDialog(context);
                        }
                      }
                    },
                    child: const Text("Узнать погоду на сегодня"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final forecast =
                          await getForecast(cityNameController.text);
                      if (forecast != null) {
                        // context.go('/');
                        navigator.push(
                          MaterialPageRoute(
                            builder: (context) => ForecastScreen(
                                cityName: cityNameController.text,
                                forecast: forecast),
                          ),
                        );
                      } else {
                        if (context.mounted) {
                          showErrorDialog(context);
                        }
                      }
                    },
                    child: const Text("Прогноз на ближайшие 3 дня"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
