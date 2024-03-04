import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Points_table extends StatefulWidget {
  const Points_table({super.key});

  @override
  State<Points_table> createState() => _Points_tableState();
}

class _Points_tableState extends State<Points_table> {
  var points ;

  Future<Object?> getpoints() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    final ref = FirebaseDatabase.instance.ref();

    try {
      final snapshot = await ref.child('Points_table').get();
      var sd = snapshot.value;
      return sd; // Return the fetched data
    } catch (error) {
      // Handle error if needed
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object?>(
      future: getpoints(), // Call getsquad() to fetch data
      builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
        // Check if the Future has completed
        if (snapshot.connectionState == ConnectionState.done) {
          // Check if data has been successfully fetched
          if (snapshot.hasData) {
            // Data has been fetched successfully, use it
            points = snapshot.data;



            return Table(
              border: TableBorder(
                top:BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black), // Add bottom border for each row
              ),

              columnWidths: {
                //0: FixedColumnWidth(40.0),
                1: FixedColumnWidth(140.0),
                2: FixedColumnWidth(37.0),
                // 3: FixedColumnWidth(25.0),
                // 4: FixedColumnWidth(25.0),
                 5: FixedColumnWidth(42.0),
              },
              children: [
                TableRow(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('Pos'),

                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('Team'),

                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('P')
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('Goals',
                          style: TextStyle(
                            fontSize: 10,
                          ),)
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('GD')
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('Pts.')
                      ),
                    ]
                ),
                for (var team in points)
                  TableRow(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Text('${team['position']}')
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('${team['team']['name']}')
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('${team['playedGames']}')
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('${team['goalsFor']}:${team['goalsAgainst']}',
                            style: TextStyle(
                              fontSize: 10,
                            ),)
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('${team['goalDifference']}',
                          style: TextStyle(
                            fontSize: 10,
                          ),)
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('${team['points']}')
                      ),
                    ]
                  )
              ],
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
    );
  }
}
