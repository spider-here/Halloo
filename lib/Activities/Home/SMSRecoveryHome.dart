import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SMSRecoveryHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SMSRecoveryHomeState();
  }

}

class SMSRecoveryHomeState extends State{
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/1.2,
      color: Colors.yellow,
    );
  }

}