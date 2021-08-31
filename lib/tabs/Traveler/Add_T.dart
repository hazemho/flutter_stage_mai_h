import 'package:easyship/model/Request.dart';
import 'package:easyship/providers/RequestProvider.dart';
import 'package:easyship/widgets/Traveler/App_bar_T.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Requests_T.dart';

class Add_T extends StatefulWidget {
  @override
  _Add_TState createState() => _Add_TState();
}

class _Add_TState extends State<Add_T> with SingleTickerProviderStateMixin {
  DateTime _Traveldate;
  DateTime _Arrivalldate;
  DateTime _Expirationdate;

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  String Departure_country = "Select Country";
  String Departure_city = "Select City";
  String Arrival_country = "Select Country";
  String Arrival_city = "Select City";
  String Relay_points = "Pick up point";
  String Delivery_points = "Delivery point";

  var _addtravel = SenderModel(
    departure_city: '',
    departure_country: '',
    arrival_city: '',
    arrival_country: '',
    arrival_date: '',
    departure_date: '',
  );

  TabController tabControllerr;

  void initState() {
    tabControllerr = TabController(length: 4, initialIndex: 0, vsync: this);
    super.initState();
  }

  void _saveformtobase() {
    _form.currentState.save();
    Provider.of<AllRequests>(context, listen: false).addNewFlight(_addtravel);
    // // Navigator.push(
    // //     context, MaterialPageRoute(builder: (context) => Navigation_t()));
    // // SnackBar(
    // //   content: Text('A travel was added'),
    // );
  }

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _form,
        child: Container(
          child: Theme(
            data: ThemeData(
                primaryColor: Colors.purpleAccent[700],
                colorScheme: ColorScheme.light(
                  primary: Colors.purpleAccent[700],
                )),
            child: Stepper(
              type: stepperType,
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: <Step>[
                Step(
                  subtitle: _currentStep == 0
                      ? Icon(
                          Icons.airplanemode_on,
                          color: Colors.purpleAccent[700],
                        )
                      : null,
                  title: Text(
                    "TRAVEL",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.purpleAccent[700],
                    ),
                  ),
                  content: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Departure",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      Icon(Icons.flight_takeoff_rounded),
                      DropdownButton<String>(
                        underline: Divider(
                          color: Colors.white,
                        ),
                        isExpanded: true,
                        hint: TextFormField(
                          onSaved: (_) {
                            _addtravel = SenderModel(
                              departure_country: Departure_country,
                              departure_city: '',
                              arrival_city: '',
                              arrival_country: '',
                              departure_date: '',
                              arrival_date: '',
                            );
                          },
                          decoration:
                              InputDecoration(labelText: Departure_country),
                        ),
                        items:
                            <String>['France', 'Tunisia'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            Departure_country = newValue;
                          });
                        },
                      ),
                      DropdownButton<String>(
                        underline: Divider(
                          color: Colors.white,
                        ),
                        isExpanded: true,
                        hint: TextFormField(
                          onSaved: (_) {
                            _addtravel = SenderModel(
                              departure_country: Departure_country,
                              departure_city: Departure_city,
                              arrival_city: '',
                              arrival_country: '',
                              departure_date: '',
                              arrival_date: '',
                            );
                          },
                          decoration:
                              InputDecoration(labelText: Departure_city),
                        ),
                        items: <String>['Paris', 'Tunis'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            Departure_city = newValue;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Arrival",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      Icon(Icons.flight_land),
                      DropdownButton<String>(
                        underline: Divider(
                          color: Colors.white,
                        ),
                        isExpanded: true,
                        hint: TextFormField(
                          onSaved: (_) {
                            _addtravel = SenderModel(
                              departure_country: Departure_country,
                              departure_city: Departure_city,
                              arrival_city: Arrival_country,
                              arrival_country: '',
                              departure_date: '',
                              arrival_date: '',
                            );
                          },
                          decoration:
                              InputDecoration(labelText: Arrival_country),
                        ),
                        items:
                            <String>['France', 'Tunisia'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            Arrival_country = newValue;
                          });
                        },
                      ),
                      DropdownButton<String>(
                        underline: Divider(
                          color: Colors.white,
                        ),
                        isExpanded: true,
                        hint: TextFormField(
                          onSaved: (_) {
                            _addtravel = SenderModel(
                              departure_country: Departure_country,
                              departure_city: Departure_city,
                              arrival_city: Arrival_country,
                              arrival_country: Arrival_city,
                              departure_date: '',
                              arrival_date: '',
                            );
                          },
                          decoration: InputDecoration(labelText: Arrival_city),
                        ),
                        items: <String>['Paris', 'Tunis'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            Arrival_city = newValue;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_Traveldate == null
                              ? 'Travel date'
                              : '${_Traveldate.day.toString()}/${_Traveldate.month.toString()}/${_Traveldate.year.toString()}'),
                          Icon(Icons.calendar_today_rounded),
                          Text(_Arrivalldate == null
                              ? 'Arrival date'
                              : '${_Arrivalldate.day.toString()}/${_Arrivalldate.month.toString()}/${_Arrivalldate.year.toString()}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purpleAccent[700],
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                            child: Text('Travel Date'),
                            onPressed: () {
                              showDatePicker(
                                builder: (BuildContext context, Widget child) {
                                  return Theme(
                                    data: ThemeData.dark(),
                                    // This will change to light theme.
                                    child: child,
                                  ); //Background color
                                },
                                context: context,
                                initialDate: _Traveldate == null
                                    ? DateTime.now()
                                    : _Traveldate,
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2030),
                              ).then((date) {
                                setState(() {
                                  _Traveldate = date;
                                });
                              });
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purpleAccent[700],
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                            child: Text('Arrival Date'),
                            onPressed: () {
                              showDatePicker(
                                builder: (BuildContext context, Widget child) {
                                  return Theme(
                                    data: ThemeData.dark(),
                                    // This will change to light theme.
                                    child: child,
                                  ); //Background color
                                },
                                context: context,
                                initialDate: _Arrivalldate == null
                                    ? DateTime.now()
                                    : _Arrivalldate,
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2030),
                              ).then((date) {
                                setState(() {
                                  _Arrivalldate = date;
                                });
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Offer Expiration date",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      Icon(Icons.timer_rounded),
                      Text(_Expirationdate == null
                          ? ''
                          : '${_Expirationdate.day.toString()}/${_Expirationdate.month.toString()}/${_Expirationdate.year.toString()}'),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purpleAccent[700],
                            textStyle: TextStyle(fontWeight: FontWeight.bold)),
                        child: Text('Pick Date'),
                        onPressed: () {
                          showDatePicker(
                            builder: (BuildContext context, Widget child) {
                              return Theme(
                                data: ThemeData.dark(),
                                // This will change to light theme.
                                child: child,
                              ); //Background color
                            },
                            context: context,
                            initialDate: _Expirationdate == null
                                ? DateTime.now()
                                : _Expirationdate,
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2030),
                          ).then((date) {
                            setState(() {
                              _Expirationdate = date;
                            });
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Transport",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      Icon(Icons.emoji_transportation_rounded),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: TabBar(
                            onTap: (index) {
                              print('get index : $index');
                            },
                            controller: tabControllerr,
                            indicatorColor: Colors.purpleAccent[700],
                            labelColor: Colors.purpleAccent[700],
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Icon(Icons.airplanemode_on),
                              Icon(Icons.car_repair),
                              Icon(Icons.train_rounded),
                              Icon(Icons.directions_boat_sharp),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                onSaved: (_) {
                                  _addtravel = SenderModel(
                                    departure_country: Departure_country,
                                    departure_city: Departure_city,
                                    arrival_city: Arrival_country,
                                    arrival_country: Arrival_city,
                                    departure_date:
                                        '${_Traveldate.day.toString()}/${_Traveldate.month.toString()}/${_Traveldate.year.toString()}',
                                    arrival_date: '',
                                  );
                                },
                                decoration: InputDecoration(
                                    labelText:
                                        'Travel Time :  ${_Traveldate.toString()}'),
                              ),
                              TextFormField(
                                  onSaved: (_) {
                                    _addtravel = SenderModel(
                                      departure_country: Departure_country,
                                      departure_city: Departure_city,
                                      arrival_city: Arrival_country,
                                      arrival_country: Arrival_city,
                                      departure_date:
                                          '${_Traveldate.day.toString()}/${_Traveldate.month.toString()}/${_Traveldate.year.toString()}',
                                      arrival_date:
                                          '${_Arrivalldate.day.toString()}/${_Arrivalldate.month.toString()}/${_Arrivalldate.year.toString()}',
                                    );
                                  },
                                  decoration: InputDecoration(
                                      labelText:
                                          'Arrival Time :  ${_Arrivalldate.toString()}')),
                              TextFormField(
                                  onSaved: (_) {
                                    _addtravel = SenderModel(
                                      departure_country: Departure_country,
                                      departure_city: Departure_city,
                                      arrival_city: Arrival_country,
                                      arrival_country: Arrival_city,
                                      departure_date:
                                          '${_Traveldate.day.toString()}/${_Traveldate.month.toString()}/${_Traveldate.year.toString()}',
                                      arrival_date:
                                          '${_Arrivalldate.day.toString()}/${_Arrivalldate.month.toString()}/${_Arrivalldate.year.toString()}',
                                      expiration_date:
                                          _Expirationdate.toString(),
                                    );
                                  },
                                  decoration: InputDecoration(
                                      labelText:
                                          'Travel Time :  ${_Expirationdate.toString()}')),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                /*   Step(
                  subtitle: _currentStep == 1
                      ? Icon(
                          Icons.add_box,
                          color: Colors.purpleAccent[700],
                        )
                      : null,
                  title: Text(
                    "PICKUP",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.purpleAccent[700],
                    ),
                  ),
                  content: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "PICKUP",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      DropdownButton<String>(
                        underline: Divider(
                          color: Colors.white,
                        ),
                        isExpanded: true,
                        hint: TextFormField(
                          decoration: InputDecoration(labelText: Relay_points),
                        ),
                        items: <String>['Paris', 'Tunis'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            Relay_points = newValue;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Add description'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
      
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state:
                      _currentStep >= 1 ? StepState.complete : StepState.disabled,
      
                ),*/

                /* Step(
                  subtitle: _currentStep == 2
                      ? Icon(Icons.check_box, color: Colors.purpleAccent[700])
                      : null,
                  title: Text(
                    "DELIVERY",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.purpleAccent[700],
                    ),
                  ),
                  content: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "DELIVERY",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      DropdownButton<String>(
                        underline: Divider(
                          color: Colors.white,
                        ),
                        isExpanded: true,
                        hint: TextFormField(
                          decoration: InputDecoration(labelText: Delivery_points),
                        ),
                        items: <String>['Paris', 'Tunis'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            Delivery_points = newValue;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Add description'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 2,
                  state:
                      _currentStep >= 2 ? StepState.complete : StepState.disabled,
                ),*/
                Step(
                  subtitle: _currentStep == 1
                      ? Icon(Icons.done_all, color: Colors.purpleAccent[700])
                      : null,
                  title: Text(
                    "CONFIRM",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.purpleAccent[700],
                    ),
                  ),
                  content: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "CONFIRM",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.purpleAccent[700],
                            ),
                          ))),
                        ],
                      ),
                      Divider(),
                      Divider(),
                      Card(
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
                                  color: Colors.purpleAccent[700],
                                  child: Center(
                                    child: Text(
                                      "Travel information",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Text(
                                    "Added on 25/07/2021 \n Expires on 27/07/2021",
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("From:Tunis"),
                                  Icon(Icons.arrow_forward),
                                  Text("To: Paris"),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      "       Departure:                      "),
                                  Text("Arrival:"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("27/08/2021    "),
                                  Icon(Icons.arrow_forward),
                                  Text("28/08/2021"),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Text("Traveling by"),
                              Icon(
                                Icons.airplanemode_on,
                                size: 30.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep == 1 ? _saveformtobase() : null;
    _currentStep < 1 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
