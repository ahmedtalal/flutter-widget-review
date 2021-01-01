import 'package:flutter/material.dart';
import 'package:flutter_review/Models/Person.dart';
import 'package:flutter_review/Screens/Profile.dart';

class Home extends StatefulWidget {
  static const String ID = "/home" ;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var homeKey = GlobalKey<ScaffoldState>() ;
  var itemList = ["item1","item2","item3","item4","item5","item6","item7","item8","item9","item10"] ;
  var name , password ;
  var formKey = GlobalKey<FormState>() ;
  var change = false ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: change ? Colors.orange : Colors.red,
          key: homeKey ,
          appBar: AppBar(
            title: Text(
              "flutter reviews" ,
              style: TextStyle(
                fontSize: 20 ,
                fontWeight: FontWeight.bold ,
              ),
            ),
            backgroundColor: Colors.blue ,
            bottom: TabBar(
              tabs: [
                
                // home tab screen
                Tab(
                  child: Text(
                    "Home" ,
                  ),
                  icon: Icon(Icons.home),
                ) ,

                // setting tab screen
                Tab(
                  child: Text(
                    "Settings"
                  ),
                  icon: Icon(
                    Icons.settings ,
                  ),
                ) ,

                // call tab screen
                Tab(
                  child: Text(
                    "calls" ,
                  ),
                  icon: Icon(
                    Icons.call ,
                  ),
                ) ,
              ],
            ),
            actions: [
              Switch(
                value: change ,
                activeColor: Colors.green,
                activeTrackColor: Colors.orange,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.tealAccent,
                onChanged: (newvalue){
                  setState(() {
                    change = newvalue ;
                  });
                },
              )
            ],
          ),

          body: TabBarView(
            children: [

              // this is home page 
              ListView(
                children: [
                  SizedBox(height: 50,) ,

                  Form(
                    key: formKey ,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [

                          // name text field 
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter your name" ,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10) ,
                                borderSide: BorderSide(
                                  color: Colors.blue ,
                                  width: 2 ,
                                )
                              )
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "name is required" ;
                              }
                              return null ;
                            },
                            onChanged: (value)=> name = value,
                          ) ,

                          SizedBox(height: 12,) ,

                          // password text field 
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter your password" ,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10) ,
                                borderSide: BorderSide(
                                  color: Colors.blue ,
                                  width: 2 ,
                                )
                              )
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "password is required" ;
                              }
                              return null ;
                            },
                            onChanged: (value)=> password = value,
                          ) ,

                          SizedBox(height: 12,) ,

                          // register button 
                          RaisedButton(
                            child: Text(
                              "Register" ,
                              style: TextStyle(
                                fontSize: 20 ,
                                color: Colors.white ,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                               if (formKey.currentState.validate()) {
                                  var person = Person(name: name , password: password) ;
                                  Navigator.pushNamed(context, Profile.ID , arguments: person) ;
                               }

                              });
                            },
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // this is settings page 
              ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context , index){
                  return Container(
                    margin: const EdgeInsets.all(8),
                    height: 100, 
                    child: Center(
                      child: Text("the item is ${index+1}"),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue ,
                        width: 1 ,
                      ),
                      borderRadius: BorderRadius.circular(10) ,
                    ),
                  ) ;
                },
              ),

              // this is call page  -------------------------->>>>>>>>>>>>>>>>>>>>>
              Center(
                child: Column(
                  children: [
                    // alert dialog button >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    RaisedButton(
                      child: Text(
                        "alert dialog" ,
                      ),
                      onPressed: (){
                        showDialog(
                          context: context ,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text("this is alert dialog"),
                              content: Text("this is content"),
                              actions: [
                                RaisedButton(onPressed: ()=> Navigator.of(context).pop() , child: Text("Cancel"),) ,
                                RaisedButton(
                                  child: Text("Ok"),
                                  onPressed: (){
                                    homeKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text("this is alert dialog"), 
                                      )
                                    );
                                  },
                                )
                              ],
                            );
                          }
                        );
                      },
                    ),

                    // custom dialog -------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    RaisedButton(
                      child: Text(
                        "custome dialog" ,
                      ),
                      onPressed: (){

                      },
                    ),

                    // full screen dialog buttom >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    RaisedButton(
                      child: Text(
                        "full screen dialog" ,
                      ),
                      onPressed: (){

                      },
                    ),

                    // external dialog buttom >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    RaisedButton(
                      child: Text(
                        "external dialog" ,
                      ),
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              )
            ]
          ),
        )
    );
  }
}
