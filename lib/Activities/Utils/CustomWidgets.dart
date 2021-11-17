import 'package:flutter/material.dart';
import 'package:halloo/Activities/Chat/Chat.dart';

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
                width: MediaQuery.of(context).size.width / 5,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imgURL), fit: BoxFit.fill),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                            style: BorderStyle.solid)),
                  ),
                  Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 6.0, right: 10.0),
                          child: onlineIndicator(onlineStatus)))
                ]),
              ),
              title: Row(
                children: [
                  Text(
                    contactName,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                  ),
                  unreadMessageIndicator(context, unreadMessage)
                ],
              ),
              subtitle: Text(
                lastMessage,
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                lastChatTime,
                style: TextStyle(color: Colors.black),
              ),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat())),
            ),
            Divider(color: Colors.grey)
          ],
        ));
  }

  Widget callHistoryContact(BuildContext context, String contactName,
      String imgURL, bool onlineStatus, String lastCallTime, bool videoCall) {
    return new Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child:
            ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imgURL), fit: BoxFit.fill),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                            style: BorderStyle.solid)),
                  ),
                  Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 6.0, right: 10.0),
                          child: onlineIndicator(onlineStatus)))
                ]),
              ),
              title: Text(
                contactName,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                lastCallTime,
                style: TextStyle(color: Colors.grey),
              ),
              trailing: TextButton.icon(
                  onPressed: () {},
                  icon: getCallTypeIcon(videoCall),
                  label: Text(""),
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.black12))),
              onTap: (){Dialog dialog = Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: callHistoryDetailContainer(context));
              showDialog(context: context, builder: (context)=>dialog);},
        ));
  }

  Widget callHistoryChat(BuildContext context, String contactName,
      String imgURL, String lastCallTime, bool videoCall) {
    return new Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child:
        ListTile(
          leading: SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imgURL), fit: BoxFit.fill),
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 3.0,
                        style: BorderStyle.solid)),
              ),
          ),
          title: Text(
            contactName,
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            lastCallTime,
            style: TextStyle(color: Colors.grey),
          ),
          trailing: TextButton.icon(
              onPressed: () {},
              icon: getCallTypeIcon(videoCall),
              label: Text(""),
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.black12))),
        ));
  }

  Widget contactItem(
    BuildContext context,
    String contactName,
    String imgURL,
    String phoneNumber,
  ) {
    return new Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child:
            ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child:
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imgURL), fit: BoxFit.fill),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                            style: BorderStyle.solid)),
                  ),
              ),
              title: Text(
                contactName,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                phoneNumber,
                style: TextStyle(color: Colors.grey),
              ),
            ),
        );
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

  Widget getCallTypeIcon(bool videoCall) {
    Widget callIcon = Icon(
      Icons.call,
      color: Colors.grey,
    );

    if (videoCall) {
      callIcon = Icon(
        Icons.videocam,
        color: Colors.grey,
      );
    }

    return callIcon;
  }

  Widget callHistoryDetailContainer (BuildContext context){
    return new Container(
      width: MediaQuery.of(context).size.width/1.1,
      height: MediaQuery.of(context).size.height/1.3,
      color: Colors.white,
      child: Padding(padding: EdgeInsets.all(5.0), child:
      Column(
          children: [ListTile(
            leading: Text("Call History"),
            trailing: InkWell(
              child: Icon(Icons.close, color: Colors.black,),
              onTap: (){},
            ),
          ),]
      ),)
    );
  }

  Widget chatSettings (BuildContext context){
    return new Container(
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white
        ),
        child: Padding(padding: EdgeInsets.all(5.0), child: Column(
          children: [ListTile(
            leading: Icon(Icons.block),
            title: Text("Block User"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.delete_sweep),
            title: Text("Recover Deleted SMS"),
            onTap: (){}
          )],
        )
        )
    );
  }

}
