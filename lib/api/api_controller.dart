import 'package:dio/dio.dart';
import 'package:sky_electronics_weather_test/api/api_key.dart';

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
      "$apiPrefix/data/2.5/forecast?q=$city&lang=ru&cnt=24&appid=$apiKey&units=metric";
  // API выдаёт прогноз за следующие x раз с промежутками в 3 часа
  // берём x = 24 т.к. 3*24 = 72 => 3 суток.
  try {
    final response = await dio.get(query);
    final result = List.empty(growable: true);
    if (response.data["cod"] == "200") {
      // i=7 чтобы пропустить первый день прогноза. Шаг = 8 т.к. 3*8 = 24 => переходим на след. сутки
      for (var i = 7; i < response.data["cnt"]; i += 8) {
        result.add(Map.from(response.data['list'][i]));
      }
      return result;
    }
  } catch (e) {
    return null;
  }
  return null;
}
