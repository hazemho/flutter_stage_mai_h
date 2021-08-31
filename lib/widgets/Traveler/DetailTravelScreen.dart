import 'package:easyship/providers/TravelProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailTravelScreen extends StatelessWidget {
  static const routeName = 'DetailTravelScreen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<TravelProvider>(
      context,
      listen: false,
    ).findById(productId);
    print(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${loadedProduct.departure_country},${loadedProduct.arrival_country}'),
      ),
      body: Card(
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
                        "Request information",
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
                      "Added on ${DateTime.now()} \n Expires ${loadedProduct.id}",
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
                Text("Package details"),
                SizedBox(height: 12.0),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("       Width: "),
                    Text("${loadedProduct.widht} m"),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("       Height: "),
                    Text("${loadedProduct.height} m"),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("       Length: "),
                    Text("${loadedProduct.length} m"),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text("Image"),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 25.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/avatar.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
