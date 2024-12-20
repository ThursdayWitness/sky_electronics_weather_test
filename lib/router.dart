import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/screens/city_input_screen.dart';
import 'package:sky_electronics_weather_test/screens/current_weather_screen.dart';
import 'package:sky_electronics_weather_test/screens/forecast_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.home.name,
      path: '/',
      pageBuilder: (context, routerState) =>
          const MaterialPage(child: CityInputScreen()),
    ),
    GoRoute(
      name: AppRoute.currentWeather.name,
      path: '/current_weather',
      pageBuilder: (context, routerState) {
        final extra = routerState.extra as List<Object>;
        final cityName = extra[0] as String;
        final currentWeather = extra[1] as Map<dynamic, dynamic>;
        return MaterialPage(
            child: CurrentWeatherScreen(
                cityName: cityName, currentWeather: currentWeather));
      },
    ),
    GoRoute(
      name: AppRoute.forecast.name,
      path: '/forecast',
      pageBuilder: (context, routerState) {
        final extra = routerState.extra as List<Object>;
        final cityName = extra[0] as String;
        final forecast = extra[1] as List<dynamic>;
        return MaterialPage(
            child: ForecastScreen(cityName: cityName, forecast: forecast));
      },
    ),
  ],
);

enum AppRoute {
  home("/"),
  currentWeather("currentWeather"),
  forecast("forecast");

  final String name;

  const AppRoute(this.name);

  static AppRoute? fromString(String? name) {
    if (name == null || name.isEmpty) return null;

    return AppRoute.values.firstWhere((element) => element.name == name);
  }
}
