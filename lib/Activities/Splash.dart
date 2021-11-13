import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halloo/Activities/Registeration/PhoneRegistration/PhoneNumberPage.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/halloo_background.png"),
                fit: BoxFit.cover)),
        child: Center(child: SizedBox( width: MediaQuery.of(context).size.width/1.5,
          child: Image.asset("assets/images/halloo_logo.png"),) ),
      ),
      nextScreen: PhoneNumberPage(),
      splashTransition: SplashTransition.fadeTransition,
    ));
  }
}
