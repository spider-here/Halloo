import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneVerificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PhoneVerifyState();
  }

}

class PhoneVerifyState extends State{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              child: Stack(
                children: [
                  Align(
                      alignment: FractionalOffset.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            child: Image.asset("assets/images/halloo_logo.png"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                          Text(
                            "Welcome to Halloo",
                            style: TextStyle(
                                fontFamily: "Playball", fontSize: 35.0),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                          Text(
                            "Please Enter Your Number to Signup",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                          Row(children:[
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                                child: TextField(),
                              ),
                          ) ])
                        ],
                      )),
                  Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 16,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("VERIFY")),
                      ))
                ],
              ),
            )));
  }

}