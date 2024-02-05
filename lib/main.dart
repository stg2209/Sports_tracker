import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Footy",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 25
          ),),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Center(
          child: Text("Home to football",
              style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontFamily: 'Roboto',
                color: Colors.black,


              ))
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {},
        child:Text("Click me",
        style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.teal[400],

      ),
    );
  }
}
