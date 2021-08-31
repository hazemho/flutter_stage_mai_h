import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easyship/tabs/Traveler/Profile_loggedOut_T.dart';
import 'package:easyship/tabs/Traveler/Chat_T.dart';
import 'package:easyship/tabs/Traveler/Notifs_T.dart';
import 'package:easyship/tabs/Traveler/Profile_T.dart';
import 'package:flutter/material.dart';
import '../../tabs/Traveler/Requests_T.dart';
import 'App_bar_T.dart';
import 'Drawer_T.dart';

class Navigation_T extends StatefulWidget {
  Navigation_T({Key key}) : super(key: key);

  @override
  _Navigation_TState createState() => _Navigation_TState();
}

class _Navigation_TState extends State<Navigation_T> {
  int _selectedIndex = 0;
  String title = 'REQUESTS';
  bool search=true;
  static List<Widget> _widgetOptions = <Widget>[
    RequestsTab_T(),
    ChatTab_T(),
    NotifsTab_T(),
    Profile_loggedOut_T(),
   //ProfileTab_T(),
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
          title = 'REQUESTS';
          search=true;
        });
        break;
      case 1:
        setState(() {
          title = 'CHAT';
          search=false;
        });
        break;

      case 2:
        setState(() {
          title = 'NOTIFICATIONS';
          search=false;
        });
        break;
      case 3:
        setState(() {
          title = 'PROFILE';
          search=false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer_T(),
      appBar: appBar_T(context, title, search),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Colors.purpleAccent[700],
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.article_outlined, color: Colors.white, size: 30),
          Icon(Icons.chat_bubble_outline_outlined, color: Colors.white, size: 30,),
          Icon(Icons.notifications_none_outlined, color: Colors.white, size: 30),
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
