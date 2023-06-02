import 'package:covid_api/provider/covidProvider.dart';
import 'package:covid_api/view/dataScreen.dart';
import 'package:covid_api/view/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CovidProvider(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (context) => HomeScreen(),
        'data': (context) => DataScreen(),
      },
    ),
  ));
}
