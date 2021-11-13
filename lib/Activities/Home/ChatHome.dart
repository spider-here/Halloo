import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halloo/Activities/Utils/CustomWidgets.dart';

class ChatHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ChatHomeState();
  }

}

class ChatHomeState extends State{

  static String sampleImgUrl = "https://media.istockphoto.com/photos/social-media-and-digital-online-concept-woman-using-smartphone-picture-id1288271580";

  CustomWidgets _customWidgets= new CustomWidgets();
  List<String> contactName = ["Ali", "Zayan", "Ayesha", "Usman"];
  List<String> imgURL = [sampleImgUrl, sampleImgUrl, sampleImgUrl, sampleImgUrl];
  List<bool> onlineStatus = [true, false, true, false];
  List<String> lastChatTime = ["2 hours", "2 hours", "2 hours", "2 hours"];
  List<String> lastMessage = ["Ok", "hello, how are you?", "Done.", "Let me take this!"];
  List<bool> unreadMessage = [true, false, false, true];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: contactName.length,
          itemBuilder: (BuildContext context, index){
            return _customWidgets.chatContact(context, contactName[index], imgURL[index],
                onlineStatus[index], unreadMessage[index], lastChatTime[index], lastMessage[index]);
          }),
    );
  }

}