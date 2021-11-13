import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'PhoneRegisteredSuccess.dart';

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
        body: SingleChildScrollView(
        child: Container(
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
                          Spacer(),
                          Container(
                            height: MediaQuery.of(context).size.height / 8,
                            child: Image.asset("assets/images/halloo_logo.png"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                          Text(
                            "Verification Code",
                            style: TextStyle(
                                fontFamily: "Playball", fontSize: 35.0),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                          Text(
                            "We have sent you a code on your phone number\n\nEnter Code Below",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0,),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                          Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: PinCodeTextField(appContext: context, length: 4, onChanged: print,
                            animationType: AnimationType.scale,
                            animationDuration: Duration(milliseconds: 300),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5.0),
                              fieldHeight: 50,
                              fieldWidth: 50,
                            ),),),
                          // Row(mainAxisAlignment: MainAxisAlignment.center,
                          //     children:[
                          // Container(
                          //     decoration: BoxDecoration(
                          //         border: Border.all(color: Colors.black),
                          //         borderRadius: BorderRadius.circular(5.0)),
                          //     child: SizedBox(
                          //     width: 40.0,
                          //     height: 40.0,
                          //       child: TextField(textAlign: TextAlign.center,),
                          //     ),
                          // ),
                          // Padding(padding: EdgeInsets.all(10.0),),
                          // Container(
                          //     decoration: BoxDecoration(
                          //         border: Border.all(color: Colors.black),
                          //         borderRadius: BorderRadius.circular(5.0)),
                          //     child: SizedBox(
                          //     width: 40.0,
                          //     height: 40.0,
                          //       child: TextField(textAlign: TextAlign.center,),
                          //     ),
                          // ),
                          // Padding(padding: EdgeInsets.all(10.0),),
                          // Container(
                          //     decoration: BoxDecoration(
                          //         border: Border.all(color: Colors.black),
                          //         borderRadius: BorderRadius.circular(5.0)),
                          //     child: SizedBox(
                          //     width: 40.0,
                          //     height: 40.0,
                          //       child: TextField(textAlign: TextAlign.center,),
                          //     ),
                          // ),
                          // Padding(padding: EdgeInsets.all(10.0),),
                          // Container(
                          //     decoration: BoxDecoration(
                          //         border: Border.all(color: Colors.black),
                          //         borderRadius: BorderRadius.circular(5.0)),
                          //     child: SizedBox(
                          //     width: 40.0,
                          //     height: 40.0,
                          //       child: TextField(textAlign: TextAlign.center,),
                          //     ),
                          // ),
                          //
                          // ]),
                          Spacer(),
                          Padding(padding: EdgeInsets.all(50.0),)
                        ],
                      )),
                  Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 16,
                        child: ElevatedButton(
                            onPressed: (){Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=>PhoneRegisteredSuccess()));},
                            child: Text("VERIFY")),
                      ))
                ],
              ),
            ))));
  }

}