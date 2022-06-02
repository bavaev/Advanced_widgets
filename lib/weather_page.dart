import 'package:flutter/material.dart';

import 'package:homework_14/themes/custom_theme.dart';
import 'package:homework_14/themes/themes.dart';

import 'widgets/sun.dart';
import 'widgets/cloud.dart';
import 'widgets/rain.dart';

class WeatherPage extends StatefulWidget {
  final String title;

  const WeatherPage({Key? key, required this.title}) : super(key: key);

  @override
  State<WeatherPage> createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation2;
  late AnimationController controller;
  bool size = true;
  bool theme = true;
  double weatherIndicator = 0.0;
  String weatherText = 'Ясно';
  int weatherTemperature = 30;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 125.0).animate(CurvedAnimation(parent: controller, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      }));
    animation2 = Tween<double>(begin: 1.0, end: 2.0).animate(CurvedAnimation(parent: controller, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      }));
  }

  List<double> _getWeatherOpacity(double point) {
    if (point < 0.1) {
      setState(() {
        weatherText = 'Ясно';
      });
      return [1.0, 0.0, 0.0];
    } else if (point >= 0.1 && point < 0.4) {
      setState(() {
        weatherText = 'Ясно';
      });
      return [1.0, 10 / 6 * point - 1 / 6.1, 0.0];
    } else if (point >= 0.4 && point < 0.7) {
      setState(() {
        weatherText = 'Облачно';
      });
      return [-10 / 3 * point + 7 / 3, 10 / 6 * point - 1 / 6.1 > 1.0 ? 1.0 : 10 / 6 * point - 1 / 6.1, 0.0];
    } else {
      setState(() {
        weatherText = 'Дождь';
      });
      return [0.0, 1.0, 10 / 3 * point - 7 / 3];
    }
  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: animation.value,
                  right: animation.value,
                  child: Transform.scale(
                    scale: animation2.value,
                    child: Stack(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            size ? controller.forward() : controller.reverse();
                            size = !size;
                          },
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Opacity(
                                    opacity: _getWeatherOpacity(weatherIndicator)[0],
                                    child: CustomPaint(
                                      painter: Sun(),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: _getWeatherOpacity(weatherIndicator)[1],
                                    child: CustomPaint(
                                      painter: Cloud(),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: _getWeatherOpacity(weatherIndicator)[2],
                                    child: CustomPaint(
                                      painter: Rain(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Opacity(
              opacity: size ? 0.0 : 1.0,
              child: Column(
                children: [
                  Text(weatherText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((weatherTemperature - weatherIndicator * 10).toStringAsFixed(1)),
                      const Icon(
                        Icons.device_thermostat,
                        size: 60,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Slider(
            value: weatherIndicator,
            onChanged: (double newPoint) {
              setState(() => weatherIndicator = newPoint);
            },
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          theme ? _changeTheme(context, MyThemeKeys.dark) : _changeTheme(context, MyThemeKeys.light);
          theme = !theme;
        },
        child: theme ? const Icon(Icons.nights_stay_outlined) : const Icon(Icons.wb_sunny_outlined),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
