import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sports_tracker/firebase_funcs.dart';


class Home_tab extends StatefulWidget {
  const Home_tab({super.key});
  // final dynamic home_tab_squad;
  //
  // const Home_tab({Key? key, required this.home_tab_squad}) : super(key: key);


  @override
  State<Home_tab> createState() => _Home_tabState();
}

class _Home_tabState extends State<Home_tab> {

  var entire_squad;

  Future<Object?> getsquad() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    final ref = FirebaseDatabase.instance.ref();

    try {
      final snapshot = await ref.child('Squad').get();
      var sd = snapshot.value;
      return sd; // Return the fetched data
    } catch (error) {
      // Handle error if needed
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child:Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,


              children: [

                ElevatedButton( // for player stats

                  onPressed: () {
                    // Add your onPressed callback here
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // Ensure that the column only occupies the space required by its children
                    children: [
                      Icon(Icons.person, color: Colors.red[700]), // Icon widget
                      SizedBox(height: 8), // Spacer between icon and text
                      Text('Squad',
                        style: TextStyle(
                          color: Colors.black,
                        ),),
                      // Text widget
                    ],
                  ), // Specify the label
                ),

                ElevatedButton( //for squad stats
                  onPressed: () {
                    // Add your onPressed callback here
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // Ensure that the column only occupies the space required by its children
                    children: [
                      Icon(Icons.people, color: Colors.red[700]), // Icon widget
                      SizedBox(height: 8), // Spacer between icon and text
                      Text('Matches',
                          style: TextStyle(
                            color: Colors.black,
                          )), // Text widget
                    ],
                  ), // Specify the label
                ),

                ElevatedButton( //for points table
                  onPressed: () {
                    // Add your onPressed callback here
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // Ensure that the column only occupies the space required by its children
                    children: [
                      Icon(Icons.table_rows_outlined, color: Colors.red[700]),
                      // Icon widget
                      SizedBox(height: 8),
                      // Spacer between icon and text
                      Text('Points table',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      // Text widget
                    ],
                  ), // Specify the label
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Column(
            children: [
              FutureBuilder<Object?>(
                  future: getsquad(), // Call getsquad() to fetch data
                  builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                    // Check if the Future has completed
                    if (snapshot.connectionState == ConnectionState.done) {
                      // Check if data has been successfully fetched
                      if (snapshot.hasData) {
                        // Data has been fetched successfully, use it
                        entire_squad = snapshot.data;
                        List<Widget> textWidgets = [];

                        for (var i in entire_squad) {
                          textWidgets.add(
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Icon(Icons.sports_soccer),
                                  SizedBox(width: 10), // Add some spacing between the icon and the text
                                  Text('${i['name']}'),
                                ],
                              ),
                              children: <Widget>[
                                // Content widgets inside the ExpansionTile
                                ListTile(
                                  title: Text('Name: ${i['name']}\n\n'
                                      'Position: ${i['position']}\n\n'
                                      'Nationality: ${i['nationality']}'),
                                ),],
                            ),
                          );
                        }

                        return Column(
                          children: textWidgets,
                        );
                      } else {
                        // Data fetch failed or is null, handle error or show loading indicator
                        return Center(child: CircularProgressIndicator()); // Or display an error message
                      }
                    } else {
                      // Future is still loading, show a loading indicator
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
            ]
    ),





    ]
    )
    );
  }
}
