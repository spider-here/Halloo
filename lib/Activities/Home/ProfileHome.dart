import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileHomeState();
  }

}

class ProfileHomeState extends State{

  static String sampleImgUrl = "https://media.istockphoto.com/photos/social-media-and-digital-online-concept-woman-using-smartphone-picture-id1288271580";


  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/1.2,
      color: Colors.white,
      child:Padding(padding: EdgeInsets.only(left: 25.0, top: 50.0, right: 25.0),
    child: Stack(
        children: [
          Align(alignment: FractionalOffset.topCenter,
          child: Column(
            children: [Container(
          decoration: BoxDecoration(
          shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(sampleImgUrl)
              ),
              color: Theme.of(context).primaryColor
          ),
            height: MediaQuery.of(context).size.height / 5,
            ),
        Padding(padding: EdgeInsets.all(10.0),),
              Text("Your Name Here", style: TextStyle(color: Theme.of(context).primaryColor,
              fontSize: 25.0)),
              Padding(padding: EdgeInsets.all(5.0),),
              Text("About/Age", style: TextStyle(color: Theme.of(context).primaryColor,
              fontSize: 14.0)),
              Padding(padding: EdgeInsets.all(10.0),),
              Text("Bio", style: TextStyle(color: Colors.black,
              fontSize: 14.0)),
              Padding(padding: EdgeInsets.all(10.0),),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text("this is address"),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("this is email"),
              ),
              ListTile(
                leading: Icon(Icons.web),
                title: Text("this is web"),
              ),

            ],
          ),),
          Align(alignment: FractionalOffset.topRight,
          child: InkWell(
            child: Icon(Icons.edit, color: Colors.black),
            onTap: (){},
          ),)
        ],
      )
      )));
  }

}