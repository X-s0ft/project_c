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
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(186, 23, 152, 175),
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
  textButtonTheme: TextButtonThemeData( 
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontFamily: 'Ubuntu',
      ),
      foregroundColor: Colors.black,
    ),
  ),
);
