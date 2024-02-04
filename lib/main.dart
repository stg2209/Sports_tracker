import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title:Text("Footy"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: Center(
      child: Text("Home to football")
    ),
    floatingActionButton:FloatingActionButton(onPressed: () {
      child:Text("Click");
      backgroundColor: Colors.teal;
    },

    ),
  ),
));
