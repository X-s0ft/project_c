import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 20,
      color: Colors.black,
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Color.fromARGB(186, 23, 152, 175),
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontFamily: 'Ubuntu',
      fontSize: 20,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(186, 23, 152, 175),
        width: 1.5,
      ),
    ),
    hintStyle: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 16,
    ),
    labelStyle: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 16,
      color: Colors.black,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 18,
        fontFamily: 'Ubuntu',
      ),
      foregroundColor: Colors.black,
      side: const BorderSide(
        width: 1.5,
      ),
    ),
  ),
);
