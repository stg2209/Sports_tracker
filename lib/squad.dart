import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class Squad_details extends StatefulWidget {
  const Squad_details({Key? key}) : super(key: key);


  @override
  State<Squad_details> createState() => _Squad_detailsState();
}

class _Squad_detailsState extends State<Squad_details> {

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
    return FutureBuilder<Object?>(
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
    );
  }
}
