import 'package:easyship/widgets/Sender/App_bar_S.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  final Color Theme;

  const ContactUs({Key key, this.Theme}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EASYSHIP"),
          backgroundColor: widget.Theme,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Our offices',
                    style: TextStyle(
                        //  color: widget.Theme,
                        fontSize: 40,
                        fontStyle: FontStyle.italic)),
                Divider(
                  thickness: 2.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("New York, USA",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text("55 Prospect St #401, Brooklyn, NY 11201",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("Hong Kong",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text("20/F, Hua Fu Commercial Building, 111 Queen's Road West",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("Singapore",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text("114 Lavender Street, CT Hub 2 #02-64, Singapore 338729",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("Taiwan",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(
                    "No. 119, Section 1, Chongqing South Road, Zhongzheng District, Taipei 10045",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("Melbourne",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(
                    "Level 4, 152 Elizabeth Street, Melbourne VIC 3000, Australia",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("London",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(
                    "Huddle, Suite 302a, 3 Shortlands, Hammersmith, London W6 8DA, UK",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("Toronto",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(
                    "Coming Soon",
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ],
            ),
          ),
        ));
  }
}
