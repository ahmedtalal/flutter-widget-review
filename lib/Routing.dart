import 'package:flutter/material.dart';
import 'package:flutter_review/Screens/Home.dart';
import 'package:flutter_review/Screens/Profile.dart';

var route = <String , WidgetBuilder>{
  Home.ID : (context) => Home() ,
  Profile.ID : (context) => Profile() ,
} ;