import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ProfileRegisteration.dart';

class PhoneRegisteredSuccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneRegSuccessState();
  }
}

class PhoneRegSuccessState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/halloo_background.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
      child:  Stack(children: [
          Align(
            alignment: FractionalOffset.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Spacer(),
              Container(
                height: MediaQuery.of(context).size.height / 8,
                child: Image.asset("assets/images/halloo_logo.png"),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Image.asset("assets/images/success_tick.png"),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                "Verification Successful",
                style: TextStyle(fontFamily: "Playball", fontSize: 35.0),
              ),
              Spacer(),
              Padding(padding: EdgeInsets.all(50.0),)
            ]),
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 16,
                child: ElevatedButton(
                    onPressed: (){Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>ProfileRegisteration()));},
                    child: Text("CONTINUE")),
              ))
        ]),
      ),
    )));
  }
}
