import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }

}

class ChatState extends State{

  List<ChatMessage> _messages = [];
  ChatUser user =ChatUser(name: "Name", uid: "uid");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: DashChat(messages: [], onSend: (ChatMessage) {  }, user: user,),
    );
  }

}