import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NotifsCard_S() {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 60.0,
            height: 80.0,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/avatar.png'), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(75.0)),),
          ),
          Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container( width: 200.0, child: Text('Med Nefzi did accept your Booking to Tunis.')),
                  SizedBox(height: 10.0,),
                  Text("18 May 2021 at 05:20", style: TextStyle(fontSize: 10)),
                ],
              )),
          Spacer(flex: 1,),
          Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    ),
  );
}

