import 'package:easyship/model/TravelModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TravelProvider with ChangeNotifier {
  List<TravelModel> _items = [];

  List<TravelModel> get items {
    return [..._items];
  }

  TravelModel findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addNewFlight(TravelModel product) async {
    print(1);
    final url = Uri.https(
        'easyship-d3843-default-rtdb.firebaseio.com', '/Travels.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'departure_country': product.departure_country,
          'departure_city': product.departure_city,
          'arrival_country': product.arrival_country,
          'arrival_city': product.arrival_city,
          'requestExpirationDate': product.requestExpirationDate,
          'package': product.package,
          'height': product.height,
          'width': product.height,
          'length': product.length,
          'weight': product.weight,
          'id': DateTime.now().toString(),
        }),
      );

      final newProduct = TravelModel(
        departure_country: product.departure_country,
        departure_city: product.departure_city,
        arrival_country: product.arrival_country,
        arrival_city: product.arrival_city,
        requestExpirationDate: product.requestExpirationDate,
        package: product.package,
        height: product.height,
        widht: product.height,
        length: product.length,
        weight: product.weight,
        id: product.id,
      );
      print('object');

      _items.add(newProduct);
      print(_items);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
      print(4);
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.https(
        'easyship-d3843-default-rtdb.firebaseio.com', '/Travels.json');
    {
      final response = await http.get(url);
      print(response.body);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<TravelModel> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(TravelModel(
          id: prodData['id'],
          departure_country: prodData['departure_country'],
          departure_city: prodData['departure_city'],
          arrival_city: prodData['arrival_city'],
          arrival_country: prodData['arrival_country'],
          package: prodData['package'],
          weight: prodData['weight'],
          widht: prodData['width'],
          length: prodData['length'],
          height: prodData['height'],
        ));
      });
      _items = loadedProducts;

      notifyListeners();
    }
  }
}
