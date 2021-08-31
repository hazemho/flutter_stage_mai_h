import 'package:easyship/screens/scnd_screen.dart';
import 'package:easyship/tabs/Sender/Offers_S.dart';
import 'package:easyship/tabs/Sender/Profile_S.dart';
import 'package:easyship/widgets/Sender/Navigation_S.dart';
import 'package:flutter/material.dart';

class drawer_S extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          color: Colors.grey[400],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  //height: 90.0,
                  child: DrawerHeader(
                child: Center(
                  child: Text(
                    'SENDER AREA',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/customer.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(Icons.home, size: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Home'),
                  ),
                ]),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Navigation_S())),
                padding: EdgeInsets.only(left: 30.0, top: 20.0),
              ),
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(Icons.settings, size: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Settings'),
                  ),
                ]),
                onPressed: () {},
                // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileTab_S())),
                padding: EdgeInsets.only(left: 30.0, top: 30.0),
              ),
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(Icons.logout, size: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Logout'),
                  ),
                ]),
                onPressed: () => print('test'),
                padding: EdgeInsets.only(left: 30.0, top: 20.0),
              ),
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(Icons.compare_arrows, size: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Switch'),
                  ),
                ]),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => scnd_screen()),
                    (Route<dynamic> route) => false),
                padding: EdgeInsets.only(left: 30.0, top: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
