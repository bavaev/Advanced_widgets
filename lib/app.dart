import 'package:flutter/material.dart';

import 'weather_page.dart';
import 'themes/custom_theme.dart';

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
