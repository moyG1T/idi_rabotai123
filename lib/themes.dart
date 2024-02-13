import 'package:flutter/material.dart';
import 'package:idi_rabotai123/constants/colors.dart';

ThemeData darkTheme = ThemeData(
    cardTheme: const CardTheme(
      color: lightColor2
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
        backgroundColor: lightColor, titleTextStyle: headerTextStyle),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColor,
        selectedItemColor: accentColor,
        unselectedItemColor: accentColor2,
        selectedLabelStyle: labelTextStyle,
        unselectedLabelStyle: labelTextStyle));

TextStyle headerTextStyle =
    const TextStyle(fontSize: 30, fontFamily: 'Open Sans', color: accentColor);

TextStyle labelTextStyle =
    const TextStyle(fontSize: 14, fontFamily: 'Open Sans', color: accentColor);

TextStyle labelTextStyle2 =
    const TextStyle(fontSize: 18, fontFamily: 'Open Sans', color: accentColor);
