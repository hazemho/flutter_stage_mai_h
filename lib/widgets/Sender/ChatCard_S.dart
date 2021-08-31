import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ChatCard_S() {
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
                  height: 60.0,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/avatar.png'), fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),),
                ),
                Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('@anonymous'),
                        SizedBox(height: 5.0,),
                        Container(width:150.0, child: Text("this is a great service!")),
                      ],
                    )),
                Spacer(flex: 1,),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('2:55 pm')),
              ],
            ),
          ),
        );
}

