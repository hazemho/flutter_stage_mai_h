import 'package:easyship/model/Request.dart';
import 'package:easyship/providers/RequestProvider.dart';
import 'package:easyship/providers/TravelProvider.dart';
import 'package:easyship/widgets/Sender/DetailWidget_S.dart';
import 'package:easyship/widgets/Sender/Navigation_S.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'offerCard_s';
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<AllRequests>(
      context,
      listen: false,
    ).findById(productId);
    print(productId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loadedProduct.arrival_city),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: DetailWidget_S(loadedProduct: loadedProduct),
    );
  }
}
