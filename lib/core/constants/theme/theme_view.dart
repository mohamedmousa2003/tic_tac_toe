import 'package:flutter/material.dart';
import 'package:xo_game/core/constants/app_colors.dart';

class ApplicationTheme {
  static ThemeData themeLight = ThemeData(
     scaffoldBackgroundColor: transparent,
     
      appBarTheme: AppBarTheme    (
        backgroundColor: transparent,
        elevation: 0 ,
        centerTitle: true,
        iconTheme: const IconThemeData(
          size: 35,
          color: blue,
        )
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 30,
            color: black,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 23,
            color: primary,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 20,
            
            fontWeight: FontWeight.bold,
          )));
}
