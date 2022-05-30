import 'package:flutter/material.dart';

import 'app.dart';
import 'themes/custom_theme.dart';
import 'themes/themes.dart';

void main() {
  runApp(
    const CustomTheme(
      initialThemeKey: MyThemeKeys.light,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: CustomTheme.of(context),
      home: const WeatherPage(title: 'Weather App'),
    );
  }
}
