import 'package:easyship/widgets/Sender/App_bar_S.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  final Color Theme;

  const AboutUs({Key key, this.Theme}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("EASYSHIP"),backgroundColor: widget.Theme, ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('About us',
                  style: TextStyle(
                    //  color: widget.Theme,
                      fontSize: 35,
                      fontStyle: FontStyle.italic)),
              Divider(),
              Row(
                children: [
                  Text('Your Big Ideas, ',
                      style: TextStyle(
                          color: widget.Theme,
                          fontSize: 25,
                          fontStyle: FontStyle.normal)),
                  Text('Delivered',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontStyle: FontStyle.normal)),

                ],
              ),
              Text("Easyship is the leading shipping platform accelerating borderless eCommerce. Businesses of all sizes use our software to deliver their goods to buyers across the world.", style: TextStyle(

                  fontSize: 15,
                  fontStyle: FontStyle.normal)),
              SizedBox(height: 50.0,),
              Divider(),
              Text('EASYSHIP story',
                  style: TextStyle(
                    //  color: widget.Theme,
                      fontSize: 35,
                      fontStyle: FontStyle.italic)),
              Divider(),
              Text("We saw the future of eCommerce — and it was thousands of brands connecting with customers across the globe through a turnkey shipping platform.From that inspiration, we began creating a platform to streamline shipping and fulfillment services for sellers, small businesses and crowdfunding projects so they can seamlessly reach new markets..", style: TextStyle(

                  fontSize: 15,
                  fontStyle: FontStyle.normal))
            ],
          ),
        ));
  }
}
