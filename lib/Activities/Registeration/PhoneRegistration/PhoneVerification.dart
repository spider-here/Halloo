import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../ProfileRegisteration.dart';
import 'PhoneRegisteredSuccess.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class PhoneVerification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneNumberState();
  }
}

class PhoneNumberState extends State {

  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  var _checkedValue = true;
  String _code = "+92";
  TextEditingController _phoneNoController = new TextEditingController();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _verificationId="";
  String _otp = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _showLoading = false;

  _loginBtnOnPressed (String countryCode, TextEditingController controller){
    setState(() {
      _showLoading = true;
    });
    String phoneNo = countryCode+controller.text.toString();
    print("Phone Number Captured");
    verify(phoneNo);
  }

  verify(String phoneNo) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
      // await _firebaseAuth.signInWithCredential(credential);
        print("Verification Complete");
      setState(() {
        _showLoading = false;
      });
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>PhoneRegisteredSuccess()));
    },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification Failed");
        setState(() {
          _showLoading = false;
        });
        _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("Verification Failed")));
      },

      codeSent: (String verificationId, int? resendToken) async{
        // Update the UI - wait for the user to enter the SMS code
        setState(() {
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          this._verificationId = verificationId;
          _showLoading = false;
        });
        // String smsCode = '1234';
        print("Code Sent");
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             PhoneVerificationPage()));

        // Create a PhoneAuthCredential with the code
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        // await _firebaseAuth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: _showLoading ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor, ),) : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE ? getMobileFormWidget(context)
            : getOtpFormWidget(context)
    );
  }

  getMobileFormWidget(BuildContext context) {
    return SingleChildScrollView(
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
                          onChanged: (change){_code=change.dialCode.toString();},
                          initialSelection: 'PK',
                          favorite: ['+92','PK'],
                          alignLeft: true,
                        ),
                      ),
                              SizedBox(width:MediaQuery.of(context).size.width/2,
                                  child: TextField(
                                    controller: _phoneNoController,
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
                        value: _checkedValue,
                        activeColor: Color(0xFFF59823),
                        onChanged: (newValue) {
                          setState(() {
                            _checkedValue = newValue!;
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
                        onPressed: ()=>_loginBtnOnPressed(_code, _phoneNoController),
                        child: Text("LOGIN")),
                  ))
            ],
          ),
        )));
  }

  getOtpFormWidget(BuildContext context) {
    return SingleChildScrollView(
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
                            child: PinCodeTextField(appContext: context, length: 6, onChanged: (change){
                              setState((){_otp = change;});
                            },
                              animationType: AnimationType.scale,
                              animationDuration: Duration(milliseconds: 300),
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5.0),
                                fieldHeight: 40,
                                fieldWidth: 30,
                              ),),),
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
                            onPressed: () async{
                              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: _otp);
                              signInWithPhoneAuthCredential(credential);
                              },
                            child: Text("VERIFY")),
                      ))
                ],
              ),
            )));
  }
  void signInWithPhoneAuthCredential(PhoneAuthCredential credential) async{
    print("Signing in with phone");
    setState(() {
      _showLoading = true;
    });
    try{
      final _authCredential=await _firebaseAuth.signInWithCredential(credential);
      setState(() {
        _showLoading = false;
      });

      if(_authCredential?.user!=null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileRegisteration()));
      }
    }
    catch(e){
      setState(() {
        _showLoading = false;
      });
      _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(e.toString())));
    }

  }
}

