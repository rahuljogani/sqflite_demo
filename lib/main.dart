import 'package:flutter/material.dart';
import 'package:sqflite_app/model/update/update_screen.dart';
import 'package:sqflite_app/model/view/user_information.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),

      home:  userInformation(),
        routes: {
          "UpdateScreen":(BuildContext context) =>UpdateScreen(),
        },
    );
  }
}

