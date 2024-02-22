import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sports_tracker/firebase_funcs.dart';


class Home_tab extends StatefulWidget {
  //const Home_tab({super.key});
  final dynamic home_tab_squad;

  const Home_tab({Key? key, required this.home_tab_squad}) : super(key: key);


  @override
  State<Home_tab> createState() => _Home_tabState();
}

class _Home_tabState extends State<Home_tab> {

  var entire_squad;

  void initState() {
    super.initState();
    // Call your function here
    entire_squad = getsquad();
  }


  Future<Object?> getsquad() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    final ref = FirebaseDatabase.instance.ref();


    try {
      final snapshot = await ref.child('Squad').get();
      var sd = snapshot.value;
      entire_squad = sd;
      return entire_squad;
    }
    catch (error) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> textWidgets = [];

    // Loop to create 5 Text widgets with numbers 1 to 5
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
    children: textWidgets,
    )


              // child:FutureBuilder<Object?>(
              //   future: entire_squad,
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       // Display your squad data here
              //       return Text('Squad Data: ${snapshot.data}');
              //     }
              //   },
              // ),



    ]
    )
    );
  }
}
