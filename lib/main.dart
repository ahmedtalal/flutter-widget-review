import 'package:flutter/material.dart';
import 'package:flutter_review/Routing.dart';
import 'package:flutter_review/Screens/Home.dart';

main()=> runApp(MyApp()) ;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(
          size: 100,
          color: Colors.blue ,
        ) ,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.blue ,
            fontSize: 25 ,
            fontWeight: FontWeight.bold ,
          )
        )
      ),
      initialRoute: Home.ID ,
      routes: route ,
    );
  }
}
