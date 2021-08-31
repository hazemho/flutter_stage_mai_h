import 'dart:convert';

import 'package:easyship/model/Request.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AllRequests with ChangeNotifier {
  List<SenderModel> _items = [
    // SenderModel(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   departure: 'A red shirt - it is pretty red!',
    //   arrival: 'ss',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // SenderModel(
    //   id: 'p2',
    //   title: 'Trousers',
    //   departure: 'A nice pair of trousers.',
    //   arrival: 'ss',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // SenderModel(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   departure: 'Warm and cozy - exactly what you need for the winter.',
    //   arrival: 'ss',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // SenderModel(
    //   id: 'p4',
    //   title: 'A Pan',
    //   departure: 'Prepare any meal you want.',
    //   arrival: 'ss',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  List<SenderModel> get items {
    return [..._items];
  }

  SenderModel findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.https(
        'easyship-d3843-default-rtdb.firebaseio.com', '/allRequests.json');
    {
      final response = await http.get(url);

      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<SenderModel> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(SenderModel(
          id: prodData['id'],
          departure_city: prodData['departure_city'],
          departure_country: prodData['departure_country'],
          arrival_city: prodData['arrival_city'],
          arrival_country: prodData['arrival_country'],
          departure_date: prodData['departure_date'],
          arrival_date: prodData['arrival_date'],

          // id: prodId,
          // title: prodData['title'],
          // departure: prodData['departure'],
          // arrival: prodData['arrival'],
          // price: prodData['price'],
          // isRequested: prodData[false],
          // imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    }
  }

  Future<void> addNewFlight(SenderModel product) async {
    final url = Uri.https(
        'easyship-d3843-default-rtdb.firebaseio.com', '/allRequests.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'departure_city': product.departure_city,
          'departure_country': product.departure_country,
          'arrival_city': product.arrival_city,
          'arrival_country': product.arrival_country,
          'departure_date': product.departure_date,
          'arrival_date': product.arrival_date,
          'id':
              '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}',
          // 'title': product.title,
          // 'departure': product.departure,
          // 'arrival': product.arrival,
          // 'price': product.price,
          // 'isRequested': product.isRequested,
        }),
      );

      final newProduct = SenderModel(
        departure_city: product.departure_city,
        departure_country: product.departure_country,
        arrival_city: product.arrival_city,
        arrival_country: product.arrival_country,
        departure_date: product.departure_date,
        arrival_date: product.arrival_date,
        id: product.id,

        // title: product.title,
        // departure: product.departure,
        // arrival: product.arrival,
        // price: product.price,
        // isRequested: product.isRequested,
        // id: json.decode(response.body)['title'],
      );

      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
      print(4);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
