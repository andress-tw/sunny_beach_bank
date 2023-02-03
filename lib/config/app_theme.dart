import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static const fontColorOnDark = Colors.white;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.indigo,
      scaffoldBackgroundColor: Colors.grey[200],
      appBarTheme:
          const AppBarTheme().copyWith(backgroundColor: primary, elevation: 0),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: const TextStyle(fontWeight: FontWeight.w300),
              backgroundColor: primary,
              foregroundColor: fontColorOnDark,
              shape: const StadiumBorder())),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
      ));
}
