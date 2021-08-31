import 'package:easyship/providers/RequestProvider.dart';
import 'package:easyship/providers/TravelProvider.dart';
import 'package:easyship/screens/DetailScreen_S.dart';
import 'package:easyship/screens/getting_started_screen.dart';
import 'package:easyship/widgets/Traveler/DetailTravelScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class CanGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AllRequests(),
        ),
        ChangeNotifierProvider.value(
          value: TravelProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'EASYSHIP',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: GettingStartedScreen(),
          routes: {
            DetailScreen.routeName: (ctx) => DetailScreen(),
            DetailTravelScreen.routeName: (ctx) => DetailTravelScreen(),
          }),
    );
  }
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("oups");
          //print(snapshot.error.toString());
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return CanGoApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(child: CircularProgressIndicator());
      },
    );
  }
}
/*


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EASYSHIP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GettingStartedScreen(),
    );
  }

}
*/
