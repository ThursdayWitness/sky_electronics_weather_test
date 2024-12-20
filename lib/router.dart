import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_electronics_weather_test/screens/city_input_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.home.name,
      path: '/',
      pageBuilder: (context, state) =>
          const MaterialPage(child: CityInputScreen()),
    ),
    // GoRoute(
    //   name: AppRoute.home.name,
    //   path: '/current_weather',
    //   pageBuilder: (context, state) =>
    //   MaterialPage(child: CurrentWeatherScreen(cityName: cityName, currentWeather: currentWeather)),
    // ),
    // GoRoute(
    //   name: AppRoute.home.name,
    //   path: '/forecast',
    //   pageBuilder: (context, state) =>
    //   const MaterialPage(child: CityInputScreen()),
    // ),
  ],
);

enum AppRoute {
  home("home"),
  currentWeather("currentWeather"),
  forecast("forecast"),
  rewards("rewards");

  final String name;

  const AppRoute(this.name);

  static AppRoute? fromString(String? name) {
    if (name == null || name.isEmpty) return null;

    return AppRoute.values.firstWhere((element) => element.name == name);
  }
}
