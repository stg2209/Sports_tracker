import 'package:flutter/material.dart';
import 'package:sports_tracker/firebase_funcs.dart';


class Home_tab extends StatelessWidget {
  const Home_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,


        children: [

          ElevatedButton(// for player stats

            onPressed: () {
              // Add your onPressed callback here
            },
            child:Column(
              mainAxisSize: MainAxisSize.min, // Ensure that the column only occupies the space required by its children
              children: [
                Icon(Icons.person,color: Colors.red[700]), // Icon widget
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
              getData();
              // Add your onPressed callback here
            },
            child:Column(
              mainAxisSize: MainAxisSize.min, // Ensure that the column only occupies the space required by its children
              children: [
                Icon(Icons.people,color:Colors.red[700]), // Icon widget
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
                Icon(Icons.table_rows_outlined,color:Colors.red[700]), // Icon widget
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
        ),
        SizedBox(height:30),
        Container(
          child: Center(
          child:ExpansionTile(

            backgroundColor: Colors.yellow[50],
          title: Text(
            'Coffee',
              style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              ),
            textAlign: TextAlign.center,
            ) ,
          ),
        ),
        ),
        ]
    );
  }
}
