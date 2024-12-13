import 'package:flutter/material.dart';

final maintheme = ThemeData(
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
      fontWeight: FontWeight.w700,
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(
        borderSide: BorderSide(
      color: Color.fromARGB(186, 23, 152, 175),
      ),
    ),
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
    cursorColor: Color.fromARGB(186, 23, 152, 175),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 18,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w700,
      ),
      foregroundColor: Colors.white,
      backgroundColor: Color.fromARGB(186, 23, 152, 175),
    ),
  ),
);
