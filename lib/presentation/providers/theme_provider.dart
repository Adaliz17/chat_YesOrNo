import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  int _selectedColor = 0;
  int get selectedColor => _selectedColor;

  void setTheme(int theme) {
    _selectedColor = theme;
    notifyListeners();
  }

  ThemeData get theme => AppTheme(selectedColor: _selectedColor).theme();
}