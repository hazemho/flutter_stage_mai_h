import 'package:easyship/model/Request.dart';
import 'package:flutter/material.dart';

class DetailWidget_S extends StatelessWidget {
  const DetailWidget_S({
    this.loadedProduct,
  });

  final SenderModel loadedProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Departure Date: ${loadedProduct.departure_date}',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  Text(
                    'Arrival Date : ${loadedProduct.arrival_date} ',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 2.0,
          // margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                  child: Container(
                    color: Colors.cyanAccent[700],
                    child: Center(
                      child: Text(
                        "Travel information",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      "Added on ${loadedProduct.id} \n Expires on 27/07/2021",
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("From:${loadedProduct.departure_city}"),
                    Icon(Icons.arrow_forward),
                    Text("To: ${loadedProduct.arrival_city}"),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("       Departure:                      "),
                    Text("Arrival:"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${loadedProduct.departure_date}'),
                    Icon(Icons.arrow_forward),
                    Text('${loadedProduct.arrival_date}'),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text("Traveling by"),
                Icon(
                  Icons.airplanemode_on,
                  size: 30.0,
                )
              ],
            ),
          ),
        ),
        // Card(
        //   elevation: 2.0,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       Container(
        //         color: Colors.cyanAccent[700],
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             children: [
        //               Expanded(
        //                 child: Center(
        //                   child: Text(
        //                     'Depart : y ',
        //                     style: TextStyle(
        //                       fontSize: 18.0,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               Icon(Icons.airplanemode_on)
        //             ],
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Row(
        //         children: [
        //           Icon(Icons.departure_board),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             'From: ${loadedProduct.departure_country},${loadedProduct.departure_city} ',
        //             style: TextStyle(fontSize: 20),
        //           ),
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           Icon(Icons.share_arrival_time),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             'To: ${loadedProduct.arrival_country},${loadedProduct.arrival_city}',
        //             style: TextStyle(fontSize: 20),
        //           ),
        //         ],
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Center(
        //         child: Column(
        //           children: [
        //             Text(
        //               's',
        //               style: TextStyle(fontSize: 20),
        //             ),
        //             Icon(Icons.flag)
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 30,
        // ),
        // Center(
        //   child: Text(
        //     'Payloads Information',
        //     style: TextStyle(fontSize: 30),
        //   ),
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // Card(
        //   child: ListTile(
        //     leading: Icon(Icons.leaderboard, size: 48.0),
        //     title: Text('Expiration Date :${loadedProduct.expiration_date}'),
        //     subtitle:
        //         Text('A sufficiently long \nsubtitle warrants three lines.'),
        //     trailing: Icon(Icons.more_vert),
        //     isThreeLine: true,
        //   ),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // Card(
        //   child: ListTile(
        //     leading: Icon(Icons.leaderboard, size: 48.0),
        //     title: Text('Letter'),
        //     subtitle:
        //         Text('A sufficiently long \nsubtitle warrants three lines.'),
        //     trailing: Icon(Icons.more_vert),
        //     isThreeLine: true,
        //   ),
        // ),
      ],
    );
  }
}
