import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Activities/Splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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