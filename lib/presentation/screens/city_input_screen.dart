import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/api/api_controller.dart';
import 'package:sky_electronics_weather_test/presentation/error_dialog.dart';

class CityInputScreen extends StatefulWidget {
  const CityInputScreen({super.key});

  @override
  State<CityInputScreen> createState() => _CityInputScreenState();
}

class _CityInputScreenState extends State<CityInputScreen> {
  final cityNameController = TextEditingController();

  @override
  void dispose() {
    cityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
