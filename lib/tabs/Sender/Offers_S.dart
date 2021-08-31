import 'package:easyship/providers/RequestProvider.dart';
import 'package:easyship/tabs/Sender/Add_S.dart';
import 'package:easyship/widgets/Sender/AllRequestsGridView.dart';
import 'package:easyship/widgets/Sender/OfferCard_S.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffersTab_S extends StatefulWidget {
  @override
  _OffersTab_SState createState() => _OffersTab_SState();
}

class _OffersTab_SState extends State<OffersTab_S> {
  bool _search = false;
  String firstTitle = 'REQUESTS';
  String secondTitle = 'ADD REQUESTS';
  @override
  void initState() {
    Provider.of<AllRequests>(context, listen: false).fetchAndSetProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _search = !_search;
          });
        },
        child: Icon(
          _search ? Icons.close : Icons.add,
        ),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: !_search
          ? DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 74.0,
                  elevation: 0.0,
                  bottom: TabBar(
                    indicatorColor: Colors.cyanAccent[700],
                    labelColor: Colors.cyanAccent[700],
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                          text: 'ALL REQUESTS',
                          icon: Icon(Icons.auto_awesome_motion)),
                      GestureDetector(
                        onTap: () {
                          // Provider.of<AllRequests>(context, listen: false)
                          //     .addProduct();
                        },
                        child: Tab(
                          text: 'MY REQUESTSs',
                          icon: Icon(Icons.bookmarks_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
                body: Container(
                  child: AllRequestsGridView(),
                ),
              ),
            )
          : Add_S(),
    );
  }
}
