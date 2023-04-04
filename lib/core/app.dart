import 'package:flutter/material.dart';
import 'package:majester_car_wash/core/theme.dart';
import 'package:majester_car_wash/features/onboarding/presentation/pages/welcome.dart';

/// this is the root of the application widget tree
class CarWashApp extends StatelessWidget {
  const CarWashApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: buildScaffoldColor(context),
          colorScheme: buildColorScheme(context),
          textTheme: buildTextTheme(context),
          appBarTheme: buildAppBarTheme(context),
          disabledColor: const Color(0xffF1F1F1),
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: buildScaffoldColor(context),
          colorScheme: buildColorScheme(context),
          textTheme: buildTextTheme(context),
          appBarTheme: buildAppBarTheme(context),
          disabledColor: const Color(0xffF1F1F1),
        ),
        themeMode: ThemeMode.light,
        home: const WelcomePage(),
      );
}
