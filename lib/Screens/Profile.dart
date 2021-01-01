import 'package:flutter/material.dart';
import 'package:flutter_review/Models/Person.dart';

class Profile extends StatelessWidget {
  static const String ID = "/profile";
  @override
  Widget build(BuildContext context) {
    Person person = ModalRoute.of(context).settings.arguments ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home screen" ,
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [

          // name 
          Container(
            child: Text(
              "the name is ${person.name}"
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10) ,
              border: Border.all(
                color: Colors.red ,
                width: 1 ,
              )
            ),
            padding: const EdgeInsets.all(10),
          ),

          SizedBox(height: 10,) ,

           // password 
          Container(
            child: Text(
              "the password is ${person.password}"
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10) ,
              border: Border.all(
                color: Colors.red ,
                width: 1 ,
              )
            ),
            padding: const EdgeInsets.all(10),
          )
        ],
      )
    );
  }
}