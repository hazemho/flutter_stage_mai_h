import 'package:easyship/providers/RequestProvider.dart';
import 'package:easyship/widgets/Sender/OfferCard_S.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllRequestsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final requestData = Provider.of<AllRequests>(context);
    final requests = requestData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: requests.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: requests[i],
        child: OfferCard_S(
          id: requests[i].id,
          departure_country: requests[i].departure_country,
          departure_city: requests[i].departure_city,
          arrival_city: requests[i].arrival_city,
          departure_date: requests[i].departure_date,
          arrival_date: requests[i].arrival_date,
          arrival_country: requests[i].arrival_country,
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
