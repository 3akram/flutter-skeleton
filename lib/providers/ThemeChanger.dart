import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(this._themeData);
  ThemeData _themeData;

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
