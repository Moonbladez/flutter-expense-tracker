import 'package:flutter/material.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(seedColor: Colors.cyan);
ColorScheme kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: Colors.cyan, brightness: Brightness.dark);

ThemeData theme = ThemeData(
  colorScheme: kColorScheme,
  useMaterial3: true,
  fontFamily: "Raleway",
  appBarTheme: const AppBarTheme().copyWith(
    elevation: 0,
    backgroundColor: kColorScheme.primary,
    foregroundColor: kColorScheme.onPrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kColorScheme.onPrimary,
      backgroundColor: kColorScheme.primary,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    isDense: true,
  ),
  // appbar heading
  textTheme: const TextTheme().copyWith(
    titleLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: kDarkColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kDarkColorScheme.onPrimary,
      backgroundColor: kDarkColorScheme.primary,
    ),
  ),
);
