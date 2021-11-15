import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'Utils/CustomWidgets.dart';

class Contacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsState();
  }
}

class ContactsState extends State {
  static String sampleImgUrl =
      "https://media.istockphoto.com/photos/social-media-and-digital-online-concept-woman-using-smartphone-picture-id1288271580";

  CustomWidgets _customWidgets = new CustomWidgets();
  List<String> contactName = [
    "Ali",
    "Zayan",
    "Ayesha",
    "Usman",
    "Usama",
    "Ahmed"
  ];
  List<String> imgURL = [
    sampleImgUrl,
    sampleImgUrl,
    sampleImgUrl,
    sampleImgUrl,
    sampleImgUrl,
    sampleImgUrl
  ];
  List<String> phoneNumbers = [
    "+135116156616",
    "+135116156616",
    "+135116156616",
    "+135116156616",
    "+135116156616",
    "+135116156616"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(50.0),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Mostly Used",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black)),
                    ),
                  ),
                  ListView.builder(
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return _customWidgets.contactItem(
                            context,
                            contactName[index],
                            imgURL[index],
                            phoneNumbers[index]);
                      }),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("All Contacts",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: contactName.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return _customWidgets.contactItem(
                              context,
                              contactName[index],
                              imgURL[index],
                              phoneNumbers[index]);
                        }),
                  ),
                ],
              )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "CONTACTS",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40.0,
                            child: TextField(
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  contentPadding: EdgeInsets.all(5.0)),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
