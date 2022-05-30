import 'package:flutter/material.dart';

enum MyThemeKeys { light, dark }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.green,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      color: Colors.amber.shade100,
    ),
    scaffoldBackgroundColor: Colors.lightBlue[100],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.orange[200],
      foregroundColor: Colors.red,
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: 50,
        shadows: [
          Shadow(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Shadow(
            blurRadius: 12.0,
            color: Color.fromARGB(125, 0, 0, 255),
          ),
        ],
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    sliderTheme: const SliderThemeData(
      inactiveTrackColor: Colors.orange,
      activeTrackColor: Colors.blue,
      thumbColor: Colors.red,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      color: Colors.grey[800],
    ),
    scaffoldBackgroundColor: Colors.grey[600],
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 50,
        color: Colors.grey[400],
        shadows: const [
          Shadow(
            color: Colors.white,
          ),
          Shadow(
            blurRadius: 12.0,
            color: Colors.black,
          ),
        ],
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[400],
    ),
    sliderTheme: const SliderThemeData(
      inactiveTrackColor: Colors.black,
      activeTrackColor: Colors.grey,
      thumbColor: Colors.black,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
    ),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.light:
        return lightTheme;
      case MyThemeKeys.dark:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
