///Вспомогательный метод для установки первого символа в строке заглавным.
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
