import 'package:easyship/screens/DetailScreen_S.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferCard_S extends StatelessWidget {
  final String id;
  final String departure_country;
  final String departure_city;
  final String arrival_country;
  final String arrival_city;
  final String departure_date;
  final String arrival_date;
  OfferCard_S({
    this.id,
    this.arrival_city,
    this.arrival_country,
    this.departure_city,
    this.arrival_date,
    this.departure_country,
    this.departure_date,
  });
  @override
  Widget build(BuildContext context) {
    print(id);
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(DetailScreen.routeName, arguments: id);
                    }, // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => DetailScreen()),
                    //   );
                    // },
                    child: Center(
                      child: Text(
                        'Depart : $departure_country ,$departure_city ',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.cyanAccent[700],
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(Icons.airplanemode_on)
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Text(" Arrival : $arrival_country , $arrival_city",
                style: TextStyle(fontSize: 14.0, color: Colors.grey[800])),
            SizedBox(
              height: 5.0,
            ),
            Text(
                " arrival time : $arrival_date \n departure time : $departure_date ",
                style: TextStyle(fontSize: 14.0, color: Colors.grey[800])),
          ],
        ),
      ),
    );
  }
}
