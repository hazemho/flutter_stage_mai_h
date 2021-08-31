import 'package:easyship/widgets/Sender/App_bar_S.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_S extends StatefulWidget {
  const Search_S({Key key}) : super(key: key);

  @override
  _Search_SState createState() => _Search_SState();
}

class _Search_SState extends State<Search_S> with SingleTickerProviderStateMixin {
  String _country_D = "Country";
  String _city_D = "City";
  String _country_A = "Country";
  String _city_A = "City";

  DateTime _dateTime;

  TabController tabController;

  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_S(context, "SEARCH FLIGHTS", false),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Departure city",
                  style: TextStyle(
                      color: Colors.cyanAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              DropdownButton<String>(
                underline: Divider(
                  color: Colors.white,
                ),
                isExpanded: true,
                hint: TextFormField(
                  decoration: InputDecoration(labelText: _country_D),
                ),
                items: <String>['France', 'Tunis'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _country_D = newValue;
                  });
                },
              ),
              DropdownButton<String>(
                underline: Divider(
                  color: Colors.white,
                ),
                isExpanded: true,
                hint: TextFormField(
                  decoration: InputDecoration(labelText: _city_D),
                ),
                items: <String>['France', 'Tunis'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _city_D = newValue;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Arrival city",
                  style: TextStyle(
                      color: Colors.cyanAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              DropdownButton<String>(
                underline: Divider(
                  color: Colors.white,
                ),
                isExpanded: true,
                hint: TextFormField(
                  decoration: InputDecoration(labelText: _country_A),
                ),
                items: <String>['France', 'Tunis'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _country_A = newValue;
                  });
                },
              ),
              DropdownButton<String>(
                underline: Divider(
                  color: Colors.white,
                ),
                isExpanded: true,
                hint: TextFormField(
                  decoration: InputDecoration(labelText: _city_A),
                ),
                items: <String>['France', 'Tunis'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _city_A = newValue;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Maximum date",
                  style: TextStyle(
                      color: Colors.cyanAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Text(_dateTime == null
                  ? 'Nothing has been picked yet'
                  : '${_dateTime.day.toString()}/${_dateTime.month.toString()}/${_dateTime.year.toString()}'),
              Divider(),

              ElevatedButton(

                style: ElevatedButton.styleFrom(
                    primary: Colors.cyanAccent[700],
                    textStyle: TextStyle(fontWeight: FontWeight.bold)),
                child: Text('Pick a date'),
                onPressed: () {

                  showDatePicker(
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.dark(), // This will change to light theme.
                        child: child,
                      );//Background color
                    },
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2030),
                  ).then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                  });

                },
              ),
              Padding(
                padding: EdgeInsets.only(top:20.0, bottom: 12.0),
                child: Text(
                  "Preferred mean of transport",
                  style: TextStyle(
                      color: Colors.cyanAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TabBar(
                  onTap: (index) {
                    print('get index : $index');
                  },
                  controller: tabController,
                  indicatorColor: Colors.cyanAccent[700],
                  labelColor: Colors.cyanAccent[700],
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Icon(Icons.airplanemode_on),
                    Icon(Icons.car_repair),
                    Icon(Icons.train_rounded),
                    Icon(Icons.directions_boat_sharp),
                  ],
                ),
              ),
              /*    Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.airplanemode_on),
                  Icon(Icons.car_repair),
                  Icon(Icons.train_rounded),
                  Icon(Icons.directions_boat_sharp),
                ],
              ),*/
              Divider(),

              Padding(
                padding: const EdgeInsets.only(top:15.0, bottom: 15.0),
                child: FlatButton(
                  child: Text(
                    'SEARCH',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 65 ,vertical: 10.0),
                  color: Colors.cyanAccent[700],
                  textColor: Colors.white, onPressed: () {  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


