import 'package:flutter/material.dart';

/// allows us to add additional functionality to the [BuildContext] class
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isLightTheme => theme.brightness == Brightness.light;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  void showSnackbar(String message) => ScaffoldMessenger.of(this)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: colorScheme.onPrimary)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.primary,
      ),
    );
}
