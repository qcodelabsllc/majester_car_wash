import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:majester_car_wash/core/extensions.dart';

/// colors
const _kWhiteColor = Colors.white;
const _kBlackColor = Colors.black;

/// fonts
final _primaryFontFamily = GoogleFonts.dmSans(),
    _secondaryFontFamily = GoogleFonts.rubik();

/// returns the default text font for the application
TextTheme buildTextTheme(BuildContext context) =>
    GoogleFonts.dmSansTextTheme().copyWith(
      headline3: _primaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor,
          fontWeight: FontWeight.w600),
      headline4: _primaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor,
          fontWeight: FontWeight.w600),
      headline5: _primaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      headline6: _primaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      subtitle1: _secondaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      subtitle2: _primaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      button: _secondaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor,
          fontWeight: FontWeight.w600),
      bodyText1: _secondaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      bodyText2: _secondaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      caption: _secondaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      overline: _secondaryFontFamily.copyWith(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
    );

/// returns the color of the scaffold
Color buildScaffoldColor(BuildContext context) =>
    context.isLightTheme ? _kWhiteColor : _kBlackColor;

/// returns the preferred color scheme of the application
ColorScheme buildColorScheme(BuildContext context) => context.isLightTheme
    ? const ColorScheme.light(
        primary: Color(0xff3585F1),
        secondary: Color(0xff4BBC8B),
        onSecondary: _kWhiteColor,
        onPrimary: _kWhiteColor,
      )
    : const ColorScheme.dark();

/// returns the custom appbar theme
AppBarTheme buildAppBarTheme(BuildContext context) => AppBarTheme(
      systemOverlayStyle: context.isLightTheme
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      elevation: 0,
      color: context.isLightTheme ? _kWhiteColor : _kBlackColor,
      centerTitle: true,
      foregroundColor: context.isLightTheme ? _kBlackColor : _kWhiteColor,
      iconTheme: IconThemeData(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
      actionsIconTheme: IconThemeData(
          color: context.isLightTheme ? _kBlackColor : _kWhiteColor),
    );
