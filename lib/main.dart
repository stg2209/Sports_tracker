import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title:Text("Footy"),
      centerTitle: true,
      backgroundColor: Colors.teal[400],
    ),
    body: Center(
      child: Text("Home to football",
      style:TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.purple[300],


      ))
    ),
    floatingActionButton:FloatingActionButton(onPressed: () {
      child:Text("Click");
      backgroundColor: Colors.red[600];
    },

    ),
  ),
));
