import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/Home.dart';

class ProfileRegisteration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileRegState();
  }

}

class ProfileRegState extends State{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                        Text("Complete Profile", style: TextStyle(fontSize: 25.0),),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor
                          ),
                          height: MediaQuery.of(context).size.height / 8,
                          child: Stack(children: [
                            Align(
                                alignment: FractionalOffset.center,
                                child: Icon(Icons.person, size: MediaQuery.of(context).size.height / 8,
                                  color: Colors.white,),
                            ),
                            Align(
                              alignment: FractionalOffset.center,
                              child: Icon(Icons.photo_camera, size: MediaQuery.of(context).size.height / 14,
                              color: Colors.black38,)
                            )

                          ],)
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  contentPadding: EdgeInsets.all(5.0)),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  contentPadding: EdgeInsets.all(5.0)),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  contentPadding: EdgeInsets.all(5.0)),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              style: TextStyle(fontSize: 16.0),
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Bio",
                                  contentPadding: EdgeInsets.all(6.0)),
                            )
                        ),
                      ],
                    )),
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 16,
                      child: ElevatedButton(
                          onPressed: (){Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=>Home()));},
                          child: Text("CONTINUE")),
                    ))
              ],
            ),
          ))
    ));
  }

}