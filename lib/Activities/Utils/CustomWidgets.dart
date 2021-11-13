import 'package:flutter/material.dart';

class CustomWidgets {
  Widget chatContact(
      BuildContext context,
      String contactName,
      String imgURL,
      bool onlineStatus,
      bool unreadMessage,
      String lastChatTime,
      String lastMessage) {
    return new Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width/5,
                child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imgURL), fit: BoxFit.fill),
                      shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).primaryColor,width: 3.0, style: BorderStyle.solid)),
                ),
                Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Padding(padding: EdgeInsets.only(bottom: 6.0, right: 10.0), child: onlineIndicator(onlineStatus)))
              ]),),
              title: Row(
                children: [
                  Text(contactName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(left: 10.0),),
                  unreadMessageIndicator(context, unreadMessage)
                ],
              ),
              subtitle: Text(lastMessage, style: TextStyle(color: Colors.grey),),
              trailing: Text(lastChatTime, style: TextStyle(color: Colors.black),),
            ),
            Divider(color: Colors.grey)
          ],
        ));
  }

  Widget onlineIndicator(bool onlineStatus) {
    Widget widget = Container();
    if (onlineStatus) {
      widget = new Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightGreenAccent,
        ),
      );
    }
    return widget;
  }

  Widget unreadMessageIndicator(BuildContext context, bool unreadMessage) {
    Widget widget = Container();
    if (unreadMessage) {
      widget = new Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
      );
    }
    return widget;
  }
}
