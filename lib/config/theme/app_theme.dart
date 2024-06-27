import 'package:flutter/material.dart';

const Color _customColors = Color.fromARGB(255, 184, 16, 189);
const List<Color> _colorThemes = [
  _customColors,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.pink,
  Colors.yellow
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0,
            'Colors must between 0 to ${_colorThemes.length - 1}'),
        assert(selectedColor <= _colorThemes.length - 1,
            'Colors must between 0 to ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
