import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/api/api_controller.dart';

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
    final cityNameController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                width: MediaQuery.of(context).size.width / 3,
                child: TextField(
                  controller: cityNameController,
                  decoration: const InputDecoration(
                    hintText: "Город",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final currentWeather =
                        await getCurrentWeather(cityNameController.text);
                    if (context.mounted) {
                      if (currentWeather != null) {
                        context.push('/current_weather',
                            extra: [cityNameController.text, currentWeather]);
                      } else {
                        showErrorDialog(context);
                      }
                    }
                  },
                  child: const Text("Узнать погоду на сегодня"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final forecast = await getForecast(cityNameController.text);
                    if (context.mounted) {
                      if (forecast != null) {
                        context.push('/forecast',
                            extra: [cityNameController.text, forecast]);
                      } else {
                        showErrorDialog(context);
                      }
                    }
                  },
                  child: const Text("Прогноз на ближайшие 3 дня"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
