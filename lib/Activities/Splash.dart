import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halloo/Activities/Registeration/PhoneRegistration/PhoneVerification.dart';

import 'Home/Home.dart';

class Splash extends StatelessWidget {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var user;

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
      nextScreen: getNextScreen(),
      splashTransition: SplashTransition.fadeTransition,
    ));
  }

  getNextScreen(){
    try {
      user = _firebaseAuth.currentUser;
      if (user != null) {
        print("Signed In");
        return Home();
      } else {
        print("No User");
        return PhoneVerification();
      }
    } catch (e) {
      print("Error");
    }
  }
}
