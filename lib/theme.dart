import 'package:flutter/material.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blueGrey);

ThemeData theme = ThemeData(
  colorScheme: kColorScheme,
  useMaterial3: true,
  fontFamily: "Raleway",
  appBarTheme: const AppBarTheme().copyWith(
    elevation: 0,
    backgroundColor: kColorScheme.primary,
    foregroundColor: kColorScheme.onPrimary,
  ),
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    isDense: true,
  ),
);
