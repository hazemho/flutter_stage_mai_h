import 'package:easyship/widgets/Sender/NotifsCard_S.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifsTab_S extends StatefulWidget {
  @override
  _NotifsTab_SState createState() => _NotifsTab_SState();
}

class _NotifsTab_SState extends State<NotifsTab_S> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          return NotifsCard_S();
        },
      ),
    );
  }
}
