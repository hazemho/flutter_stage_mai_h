import 'package:flutter/cupertino.dart';

class TravelModel with ChangeNotifier {
  final String id;
  final String departure_country;
  final String departure_city;
  final String arrival_country;
  final String arrival_city;
  final String requestExpirationDate;
  final String package;
  final String weight;
  final String widht;
  final String height;
  String length;

  TravelModel(
      {this.id,
      this.departure_country,
      this.departure_city,
      this.arrival_country,
      this.arrival_city,
      this.requestExpirationDate,
      this.package,
      this.weight,
      this.widht,
      this.height,
      this.length});
}
