import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallPending extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CallPendingState();
  }
}

class CallPendingState extends State {
  static String sampleImgUrl =
      "https://media.istockphoto.com/photos/social-media-and-digital-online-concept-woman-using-smartphone-picture-id1288271580";

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFF6a23c),
                  Color(0xFFF59823),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(sampleImgUrl)),
                      color: Theme.of(context).primaryColor),
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Text("Ali",
                    style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Text("About/Age",
                    style: TextStyle(color: Colors.white, fontSize: 14.0)),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, color: Colors.white, size: 40.0,),
                      Padding(padding: EdgeInsets.all(5.0),),
                      Text(
                        "Calling...",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      )
                    ],
                  ),
                ),
                Spacer(),
              ],
            )));
  }
}
