import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart';

final ThemeData base = ThemeData.light();
ThemeData light = ThemeData(
  accentColor: kShrineBrown900,
  primaryColor: kShrinePink100,
  buttonTheme: base.buttonTheme.copyWith(
    buttonColor: kShrinePink100,
    colorScheme: base.colorScheme.copyWith(
      secondary: kShrineBrown900,
    ),
  ),
  buttonBarTheme: base.buttonBarTheme.copyWith(
    buttonTextTheme: ButtonTextTheme.accent,
  ),
  scaffoldBackgroundColor: kShrineBackgroundWhite,
  cardColor: kShrineBackgroundWhite,
  textSelectionColor: kShrinePink100,
  errorColor: kShrineErrorRed,
);

ThemeData dark = ThemeData(
  primaryColor: kShrinePurple,
  buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePurple,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light().copyWith(primary: kShrinePurple)),
  scaffoldBackgroundColor: kShrineSurfaceWhite,
  primaryIconTheme: base.iconTheme.copyWith(color: kShrineSurfaceWhite),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
