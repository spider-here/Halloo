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
      bottomNavigationBar: BottomNavigationBar(
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
              label: "Recover SMS"),
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
      // floatingActionButton: FloatingActionButton(onPressed: () {  },
      // child: Icon(Icons.add),
      // backgroundColor: Theme.of(context).primaryColor,),
      body:
      // Stack(
      //   children: [
      //     Align(
      //       alignment: FractionalOffset.topCenter,
      //       child:
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height,
      //         child:
              PageView(controller: _pageController,
                children: [ChatHome(), CallHome(), SMSRecoveryHome(), ProfileHome(),],),
            // ),
          // ),
          // Align(
          //   alignment: FractionalOffset.bottomCenter,
          //   child:
          // ),
      //   ],
      // ),
    );
  }
}
