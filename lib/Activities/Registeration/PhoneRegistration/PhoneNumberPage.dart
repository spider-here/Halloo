import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halloo/Activities/Registeration/PhoneRegistration/PhoneVerificationPage.dart';

class PhoneNumberPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneNumberState();
  }
}

class PhoneNumberState extends State {
  var checkedValue = true;
  List<DropdownMenuItem> numberCodes = [
    DropdownMenuItem(child: Text("+92")),
    DropdownMenuItem(child: Text("+91")),
    DropdownMenuItem(child: Text("+90")),
  ];
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
                            "Welcome to Halloo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Playball", fontSize: 35.0),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                          Text(
                            "Please Enter Your Number to Signup",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                          Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Row(children: [
                                SizedBox(
                                width: MediaQuery.of(context).size.width/3,
                            child: CountryCodePicker(
                              onChanged: print,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'PK',
                              favorite: ['+92','PK'],
                              alignLeft: true,
                            ),
                          ),
                                  SizedBox(width:MediaQuery.of(context).size.width/2,
                                      child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 16.0),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Phone Number",
                                      contentPadding: EdgeInsets.all(5.0)),
                                ))],)
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          CheckboxListTile(
                            value: checkedValue,
                            activeColor: Color(0xFFF59823),
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue = newValue!;
                              });
                            },
                            subtitle: Text(
                                "By continuing you will recieve a verification code to your phone number by SMS.\nMessage and data rates may apply."),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
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
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PhoneVerificationPage()));
                            },
                            child: Text("LOGIN")),
                      ))
                ],
              ),
            ))));
  }
}
