import 'package:flutter/material.dart';

enum ColorTheme {
  blue,
  indigo,
  red,
  purple,
  green,
  pink,
  yellow,
  black
}

const List<Color> colorThemes = [
  Colors.blue,
  Colors.indigo,
  Colors.red,
  Colors.purple,
  Colors.green,
  Colors.pink,
  Colors.yellow,
  Colors.black
];

String getColorName(int index) {
  return ColorTheme.values[index].toString().split('.').last;
}

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0,
            'Colors must between 0 to ${colorThemes.length - 1}'),
        assert(selectedColor <= colorThemes.length - 1,
            'Colors must between 0 to ${colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: colorThemes[selectedColor],
      dialogTheme: DialogTheme(
        backgroundColor: colorThemes[selectedColor],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
    );
  }
}
