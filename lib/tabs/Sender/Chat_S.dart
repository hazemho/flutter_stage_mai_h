import 'package:easyship/widgets/Sender/ChatCard_S.dart';
import 'package:easyship/widgets/Sender/MessageChat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTab_S extends StatefulWidget {
  @override
  _ChatTab_SState createState() => _ChatTab_SState();
}

class _ChatTab_SState extends State<ChatTab_S> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            //color: Colors.amber,
            height: 55,
            padding: EdgeInsets.only(left: 15,right: 15),
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (String str){
              },
              decoration: InputDecoration(
                  hintText: "Search for..."
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, i) {
                return ChatCard_S();
              },
            ),
          ),
        ],
      ),
    );
  }
}
