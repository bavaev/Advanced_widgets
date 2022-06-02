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
