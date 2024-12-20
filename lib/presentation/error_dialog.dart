import 'package:flutter/material.dart';

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
