import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CallHome.dart';
import 'ChatHome.dart';
import 'ProfileHome.dart';
import 'SMSRecoveryHome.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State {

  PageController _pageController = new PageController( initialPage: 0 );

  void _pageNavigator(int index){
    setState(() {
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(onPressed: () {  },
      // child: Icon(Icons.add),
      // backgroundColor: Theme.of(context).primaryColor,),
      body: Stack(
        children: [
          Align(
            alignment: FractionalOffset.topCenter,
            child: Column(children: [
              Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
              child: Padding(padding: EdgeInsets.fromLTRB(10.0,50.0,10.0,10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("CHAT", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  Spacer(),
                  Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 40.0,
                      child: TextField(
                        keyboardType: TextInputType.number,
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.2,
                child: PageView(controller: _pageController,
                  children: [ChatHome(), CallHome(), SMSRecoveryHome(), ProfileHome(),],),
              )

            ],)
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: BottomNavigationBar(
              elevation: 10.0,
              selectedLabelStyle: TextStyle(color: Colors.black),
              unselectedLabelStyle: TextStyle(color: Colors.grey),
              onTap: (int index){_pageNavigator(index);},
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.chat,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: "Chat",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.call,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.chat,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: "Call"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.delete_sweep,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.chat,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: "Cart"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.chat,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: "Profile")
              ],
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
