import 'package:easyship/providers/RequestProvider.dart';
import 'package:easyship/providers/TravelProvider.dart';
import 'package:easyship/widgets/Sender/OfferCard_S.dart';
import 'package:easyship/widgets/Traveler/RequestCard_T.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTravelsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final travelsData = Provider.of<TravelProvider>(context);
    final travel = travelsData.items;
    print(travel.length);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: travel.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: travel[i],
        child: RequestCard_T(
          id: travel[i].id,
          departure_country: travel[i].departure_country,
          departure_city: travel[i].departure_city,
          arrival_country: travel[i].arrival_country,
          arrival_city: travel[i].arrival_city,
          package: travel[i].package,
          weight: travel[i].weight,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
