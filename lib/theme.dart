import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 190, 190, 190),
  textTheme: TextTheme(
    titleSmall: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 42,
      color: Colors.black,
    ),
  ),
  dividerColor: Colors.black
);
