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
    return new SingleChildScrollView(child: Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
            child: Padding(padding: EdgeInsets.fromLTRB(10.0,60.0,10.0,10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("CHAT", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  Spacer(),
                  Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width/1.5,
                        height: 40.0,
                        child: TextField(
                          style: TextStyle(fontSize: 16.0),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                              contentPadding: EdgeInsets.all(5.0)),
                        ),
                      )),
                  Spacer(),
                  InkWell(
                    child: Icon(Icons.settings, color: Colors.white),
                  )
                ],
              ),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/1.3,
            child: ListView.builder(
                itemCount: contactName.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, index){
                  return _customWidgets.chatContact(context, contactName[index], imgURL[index],
                      onlineStatus[index], unreadMessage[index], lastChatTime[index], lastMessage[index]);
                }),)


        ],)
    ),);
  }

}