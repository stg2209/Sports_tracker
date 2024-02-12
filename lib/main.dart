import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: Home(),
  // theme: ThemeData(
  //   fontFamily: 'Teko',
  // ),
));


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected_index=0;
  List content_change= [

    Row(//Home
      mainAxisAlignment: MainAxisAlignment.spaceAround,


      children: [

        ElevatedButton(// for player stats

          onPressed: () {
            // Add your onPressed callback here
          },
          child:Column(
            mainAxisSize: MainAxisSize.min, // Ensure that the column only occupies the space required by its children
            children: [
              Icon(Icons.person,color: Colors.teal,), // Icon widget
              SizedBox(height: 8), // Spacer between icon and text
              Text('Player',
              style:TextStyle(
                color: Colors.black,
              )),
              // Text widget
            ],
          ),// Specify the label
        ),

        ElevatedButton(//for squad stats
          onPressed: () {
            // Add your onPressed callback here
          },
          child:Column(
            mainAxisSize: MainAxisSize.min, // Ensure that the column only occupies the space required by its children
            children: [
              Icon(Icons.people,color: Colors.teal,), // Icon widget
              SizedBox(height: 8), // Spacer between icon and text
              Text('Squad',
                  style:TextStyle(
                      color: Colors.black,
                  )), // Text widget
            ],
          ),// Specify the label
        ),

        ElevatedButton(//for points table
          onPressed: () {
            // Add your onPressed callback here
          },
          child:Column(
            mainAxisSize: MainAxisSize.min, // Ensure that the column only occupies the space required by its children
            children: [
              Icon(Icons.table_rows_outlined,color: Colors.teal,), // Icon widget
              SizedBox(height: 8), // Spacer between icon and text
              Text('Points table',
                  style:TextStyle(
                    color: Colors.black,
                  )), // Text widget
            ],
          ),// Specify the label
        ),
      ],

    ),
    Text(
      'Score',
        style: TextStyle(
          fontSize: 40,
        )

    ),
    Column(//Profile
      children: [
        TextFormField(

          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),

          ),

        ),
        SizedBox(height: 8,),
        TextFormField(

            decoration: InputDecoration(
              labelText: 'Password',
            prefixIcon: Icon(Icons.password),

          ),

        ),
        SizedBox(height: 8,),

        ElevatedButton(
            onPressed: (){},
            child: Text("Login",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
        ),


      ],
    )
  ];
  void _onTap(int index) {
    setState(() {
      selected_index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title:Text("Footy",
            style: TextStyle(
                fontSize: 25
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[400],

        ),
        body:
        Container(
          padding: EdgeInsets.all(16.0),
          child: content_change.elementAt(selected_index),

        ),

        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: selected_index,
          selectedItemColor: Colors.teal[600],

          onTap: _onTap,
        ),
      floatingActionButton: selected_index == 0 ? Float() : null,


    );
  }
}

class Float extends StatelessWidget {
  const Float({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child:Text("Add team",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'Teko',
        ),),
      backgroundColor: Colors.teal[400],

    );
  }
}


