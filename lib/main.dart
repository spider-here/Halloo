import 'package:flutter/material.dart';
import 'package:halloo/Activities/Call/CallPending.dart';
import 'Activities/Chat/Chat.dart';
import 'Activities/Chat/ChatProfile.dart';
import 'Activities/Home/Home.dart';
import 'Activities/Splash.dart';

void main() {
  runApp(MaterialApp(
    title:"Halloo",
    home: Chat(),
    theme: ThemeData(
      primaryColor: Color(0xFFF59823),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Color(0xFFF59823),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)))
      )
    ),
  ));
}