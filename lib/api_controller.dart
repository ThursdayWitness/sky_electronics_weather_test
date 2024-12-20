import 'package:dio/dio.dart';
import 'package:sky_electronics_weather_test/api_key.dart';

final dio = Dio();
const apiPrefix = "https://api.openweathermap.org";
const apiKey = API_KEY;

Future<Map?> getCurrentWeather(String city) async {
  String query =
      "$apiPrefix/data/2.5/forecast?q=$city&lang=ru&cnt=1&appid=$apiKey&units=metric";
  try {
    final response = await dio.get(query);
    if (response.data["cod"] == "200") {
      return Map.from(response.data['list'][0]);
    }
  } catch (e) {
    return null;
  }
  return null;
}

///Get forecast for the next three days
Future<List?> getForecast(String city) async {
  String query =
      "$apiPrefix/data/2.5/forecast?q=$city&lang=ru&cnt=32&appid=$apiKey&units=metric";
  try {
    final response = await dio.get(query);
    final result = List.empty(growable: true);
    if (response.data["cod"] == "200") {
      for (var i = 8; i < response.data["cnt"]; i += 8) {
        result.add(Map.from(response.data['list'][i]));
      }
      return result;
    }
  } catch (e) {
    return null;
  }
  return null;
}
