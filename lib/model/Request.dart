import 'package:flutter/foundation.dart';

class SenderModel with ChangeNotifier {
  final String id;
  final String departure_country;
  final String departure_city;
  final String arrival_country;
  final String arrival_city;
  final String departure_date;
  final String arrival_date;
  final String expiration_date;
  final String transport;
  SenderModel(
      {this.id,
      this.departure_country,
      this.departure_city,
      this.arrival_city,
      this.arrival_country,
      this.departure_date,
      this.arrival_date,
      this.expiration_date,
      this.transport});
}
