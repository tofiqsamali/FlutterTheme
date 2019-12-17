import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MyThemes { dark, light }

class ThemeNotifier with ChangeNotifier {
  static final List<ThemeData> themeData = [
    ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.lightBlueAccent),
    ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        accentColor: Colors.yellowAccent)
  ];

  MyThemes _currentTheme = MyThemes.light;
  ThemeData _currentThemeData = themeData[0];

  void switchTheme() {
    print('Switch Theme Fuction');
    currentTheme == MyThemes.light
        ? currentTheme = MyThemes.dark
        : currentTheme = MyThemes.light;
  }

  set currentTheme(MyThemes theme) {
    if (theme != null) {
      _currentTheme = theme;
      _currentThemeData =
          currentTheme == MyThemes.light ? themeData[0] : themeData[1];
      notifyListeners();
    }
  }

  get currentTheme => _currentTheme;
  get currentThemeData => _currentThemeData;
}
