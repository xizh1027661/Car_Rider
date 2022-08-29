import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:rant_car/pages/Add%20Car.dart';
import 'package:rant_car/pages/add_driver.dart';
import 'package:rant_car/pages/addfare.dart';
import 'package:rant_car/pages/admin_dashboard.dart';
import 'package:rant_car/pages/admin_login.dart';
import 'package:rant_car/pages/car_detail_user_Page.dart';
import 'package:rant_car/pages/decider_page.dart';
import 'package:rant_car/pages/driver_detail_page.dart';
import 'package:rant_car/pages/user_booking.dart';
import 'package:rant_car/pages/user_page.dart';
import 'package:rant_car/provider/app_car_helper_provider.dart';
import 'package:rant_car/provider/app_driver_helper_provider.dart';
import 'package:rant_car/provider/app_fare_halper_provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppCarHelperProvider()..getAllCarDetails()..createDatabaase()..getAllCarDetailsOnline()),
    ChangeNotifierProvider(create: (context)=>AppDriverHalperProvider()..getAllDriverDetails()..getAllDriverDetailsOnline()),
    ChangeNotifierProvider(create: (context)=>AppFareHalperProvider()..getAllFareDetails()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: DeciderPage.routeName,
      routes: {
        DeciderPage.routeName: (context) => DeciderPage(),
        AdminLogIn.routeName: (context) => AdminLogIn(),
        AdminDashBoard.routeName: (context) => AdminDashBoard(),
        UserPage.routeName: (context) => UserPage(),
        UserBookingPage.routeName: (context) => UserBookingPage(),
        AddCar.routeName:(context)=>AddCar(),
        AddDriver.routeName:(context)=>AddDriver(),
        AddFare.routeName:(context)=>AddFare(),
        CarDetailPage.routeName:(context)=>CarDetailPage(),
        DriverDetailPage.routeName:(context)=>DriverDetailPage(),

        UserBookingPage.routeName:(context)=>UserBookingPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
