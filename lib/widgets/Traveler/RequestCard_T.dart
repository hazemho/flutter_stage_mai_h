import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DetailTravelScreen.dart';

class RequestCard_T extends StatelessWidget {
  final String id;
  final String departure_country;
  final String departure_city;
  final String arrival_country;
  final String arrival_city;
  final String package;
  final String weight;

  RequestCard_T(
      {this.id,
      this.departure_city,
      this.departure_country,
      this.arrival_city,
      this.arrival_country,
      this.package,
      this.weight});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailTravelScreen.routeName, arguments: id);
      },
      child: Card(
          elevation: 2.0,
          margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$departure_country, $departure_city-$arrival_city, $arrival_country",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.purple[700],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text("$package",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800])),
                SizedBox(
                  height: 5.0,
                ),
                Text("weight : $weight",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800])),
              ],
            ),
          )),
    );
  }
}
