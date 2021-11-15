import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halloo/Activities/Utils/CustomWidgets.dart';

class ChatProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ChatProfileState();
  }

}

class ChatProfileState extends State{

  static String sampleImgUrl = "https://media.istockphoto.com/photos/social-media-and-digital-online-concept-woman-using-smartphone-picture-id1288271580";

  String contactName = "Ali";
  CustomWidgets _customWidgets= new CustomWidgets();
  List<String> lastCallTime = ["2 hours", "2 hours", "2 hours", "2 hours"];
  List<bool> videoCall = [true, false, false, true];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    backgroundColor: Colors.white,
        body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Padding(padding: EdgeInsets.only(left: 25.0,right: 25.0),
            child: Stack(
              children: [
                Align(alignment: FractionalOffset.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                    children: [Padding(padding: EdgeInsets.only(top: 50.0,),
                    child:Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(sampleImgUrl)
                          ),
                          color: Theme.of(context).primaryColor
                      ),
                      height: MediaQuery.of(context).size.height / 5,
                    ),),
                      Padding(padding: EdgeInsets.all(10.0),),
                      Text("Ali", style: TextStyle(color: Theme.of(context).primaryColor,
                          fontSize: 25.0)),
                      Padding(padding: EdgeInsets.all(5.0),),
                      Text("About/Age", style: TextStyle(color: Theme.of(context).primaryColor,
                          fontSize: 14.0)),
                      Padding(padding: EdgeInsets.all(10.0),),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.call, color: Colors.grey,),
                            label: Text(""),
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.black12))),
                          Padding(padding: EdgeInsets.all(5.0),),
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.videocam,  color: Colors.grey,),
                              label: Text(""),
                              style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(Colors.black12))),
                        ],),
                      Padding(padding: EdgeInsets.all(10.0),),
                      Text("Bio", style: TextStyle(color: Colors.black,
                          fontSize: 14.0)),
                      Padding(padding: EdgeInsets.all(10.0),),
                      Padding(
                        padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text("Call History",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/1.2,
                        child: ListView.builder(
                            itemCount: lastCallTime.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, index){
                              return _customWidgets.callHistoryChat(context, contactName, sampleImgUrl,
                                  lastCallTime[index], videoCall[index]);
                            }),)
                    ],
                  ),),),
                Align(alignment: FractionalOffset.topLeft,
                  child: Padding(padding: EdgeInsets.only(top: 50.0,),
                    child: InkWell(
                    child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
                    onTap: (){},
                  ),)
                )  ],
            )
        )));
  }
}