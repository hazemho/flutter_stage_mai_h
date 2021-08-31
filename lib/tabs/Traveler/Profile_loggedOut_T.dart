import 'package:easyship/screens/LoginPage.dart';
import 'package:easyship/screens/Search_T.dart';
import 'package:easyship/screens/SingUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile_loggedOut_T extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 25.0),
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/avatar.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
          ),
        ),
        Text("You are on EASYSHIP as a visitor!",
            style: TextStyle(
              fontSize: 15,
            )),
        SizedBox(
          height: 15.0,
        ),
        Container(
            width: 350.0,
            child: Text(
                "To get the most out of EASYSHIP, please login or create an account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ))),
        SizedBox(
          height: 30.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                color: Colors.purpleAccent[700],
                textColor: Colors.white,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(Theme: Colors.purpleAccent[700],))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  'CREATE NEW ACCOUNT',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                color: Colors.purpleAccent[700],
                textColor: Colors.white,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(Theme: Colors.purpleAccent[700],))),
              ),
            ),
          ],
        )
      ],
    );
  }
}
