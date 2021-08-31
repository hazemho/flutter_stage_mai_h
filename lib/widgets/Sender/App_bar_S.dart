import 'package:easyship/screens/Search_S.dart';
import 'package:flutter/material.dart';

Widget appBar_S(context, title, search) {
 // Widget appBar_S(BuildContext context, title, search) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.cyanAccent[700],
    title: Center(
      child: Text(
        title,
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(search? Icons.search_sharp : null),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Search_S()),),
      ),
    ],
  );
}
