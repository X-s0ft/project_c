import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 20,
    ),
  ),
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Ubuntu',
        fontSize: 20,
      )),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    hintStyle: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 16,
    ),
    labelStyle: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 16,
    ),
  ),
);
