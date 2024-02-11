import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: Home(),
  theme: ThemeData(
    fontFamily: 'Teko',
  ),
));


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:Text("Footy",
            style: TextStyle(
                fontSize: 25
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[400],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.people),
              ),
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.table_rows_outlined),
              ),
            ],
          ),
        ),
        body:
        TabBarView(
          children: <Widget>[
            Center(
              child: Text("Squad Stats",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Teko',
                ),
              ),
            ),
            Center(
              child: Text("Player Stats",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Teko',
                ),
              ),
            ),
            Center(
              child: Text("Points table",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Teko',
              ),
              ),
            ),

          ],

        ),






        bottomNavigationBar:Bottombar(),
        floatingActionButton:FloatingActionButton(
          onPressed: () {},
          child:Text("Add team",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Teko',
                color: Colors.black,
              fontSize: 15,
            ),),
          backgroundColor: Colors.teal[400],

        ),
      ),
    );
  }
}

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.deepOrange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: 'Score',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sensor_occupied),
          label: 'Profile',
          backgroundColor: Colors.green,
        ),


      ],
    );
  }
}

