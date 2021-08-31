import 'package:easyship/widgets/Traveler/NotifsCard_T.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifsTab_T extends StatefulWidget {
  @override
  _NotifsTab_TState createState() => _NotifsTab_TState();
}

class _NotifsTab_TState extends State<NotifsTab_T> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding:  EdgeInsets.all(16),
        itemBuilder: (context, i) {
          return NotifsCard_T();
        },
      ),
    );
  }
}
