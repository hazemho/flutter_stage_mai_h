import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easyship/tabs/Sender/Chat_S.dart';
import 'package:easyship/tabs/Sender/Notifs_S.dart';
import 'package:easyship/tabs/Sender/Offers_S.dart';
import 'package:easyship/tabs/Sender/Profile_S.dart';
import 'package:easyship/tabs/Sender/Profile_loggedOut_S.dart';
import 'package:flutter/material.dart';
import 'App_bar_S.dart';
import 'Drawer_S.dart';

class Navigation_S extends StatefulWidget {


  @override
  _Navigation_SState createState() => _Navigation_SState();
}

class _Navigation_SState extends State<Navigation_S> {
  int _selectedIndex = 0;
  String title = 'OFFERS';
  bool search=true ;
  static List<Widget> _widgetOptions = <Widget>[
    OffersTab_S(),
    ChatTab_S(),
    NotifsTab_S(),
    Profile_loggedOut_S()
    // ProfileTab_S(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeTitle(int index) {
    switch (index) {
      case 0:
        setState(() {
        title = 'OFFERS' ;
        search=true ;
        });
        break;
      case 1:
        setState(() {
          title = 'CHAT';
          search=false ;
        });
        break;

      case 2:
        setState(() {
          title = 'NOTIFICATIONS';
          search=false ;
        });
        break;
      case 3:
        setState(() {
          title = 'PROFILE';
          search=false ;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer_S(),
      appBar: appBar_S(context, title, search),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Colors.cyanAccent[700],
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.airplanemode_active, color: Colors.white, size: 30),
          Icon(
            Icons.chat_bubble_outline_outlined,
            color: Colors.white,
            size: 30,
          ),
          Icon(Icons.notifications_none_outlined,
              color: Colors.white, size: 30),
          Icon(Icons.person_outline_outlined, color: Colors.white, size: 30),
        ],
        onTap: (index) {
          _selectedIndex = index;
          _onItemTapped(index);
          _changeTitle(index);
        },
      ),
    );
  }
}
