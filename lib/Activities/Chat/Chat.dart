import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ChatProfile.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State {
  static String sampleImgUrl =
      "https://media.istockphoto.com/photos/social-media-and-digital-online-concept-woman-using-smartphone-picture-id1288271580";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: FractionalOffset.center,
              //child: chat widget will come here
            ),
            Align(alignment: FractionalOffset.bottomCenter),
            Align(
              alignment: FractionalOffset.topCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 5.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: ListTile(
                                leading: SizedBox(
                                  width: 40.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(sampleImgUrl),
                                          fit: BoxFit.fill),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                title: Text("UserName Here",
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text("typing..",
                                    style: TextStyle(color: Colors.white)),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatProfile())),
                              )),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}
