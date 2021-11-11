import 'package:flutter/material.dart';

import 'Activities/Splash.dart';

void main() {
  runApp(MaterialApp(
    title:"Halloo",
    home: Splash(),
    theme: ThemeData(
      primaryColor: Color(0xFFF59823),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Color(0xFFF59823),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)))
      )
    ),
  ));
}