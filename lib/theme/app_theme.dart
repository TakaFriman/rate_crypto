import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    dividerTheme: const DividerThemeData(
      color: Colors.white10,
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color.fromARGB(246, 23, 23, 23),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(246, 23, 23, 23),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
