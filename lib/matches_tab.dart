import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Matches_tab extends StatefulWidget {
  const Matches_tab({super.key});

  @override
  State<Matches_tab> createState() => _Matches_tabState();
}

class _Matches_tabState extends State<Matches_tab> {

  var matches;

  var bundesliga_em;

  Future<Object?> getmatches() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    final ref = FirebaseDatabase.instance.ref();

    try {
      final snapshot = await ref.child('Matches').get();
      var sd = snapshot.value;
      return sd; // Return the fetched data
    } catch (error) {
      // Handle error if needed
      return null;
    }
  }

  Future<String?> fetchImageUrl() async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child("Competitions/Bundesliga/image.png"); // Provide the path to your PNG image
      String downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error fetching image URL: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object?>(
      future: getmatches(), // Call getsquad() to fetch data
      builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
        // Check if the Future has completed
        if (snapshot.connectionState == ConnectionState.done) {
          // Check if data has been successfully fetched
          if (snapshot.hasData) {
            // Data has been fetched successfully, use it
            matches = snapshot.data;
           int curr_matchday= matches[0]['season']['currentMatchday'] + matches[7]['season']['currentMatchday'];
            List<Widget> textWidgets = [];
            int check=0;

            for (var match in matches) {
              if (check<=curr_matchday){
              textWidgets.add(
                ExpansionTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:[
                      FutureBuilder<String?>(future:fetchImageUrl(),
                          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              return Image.network(snapshot.data!,width: 15, // Set the width of the image
                                height: 15, // Set the height of the image
                                fit: BoxFit.cover, );
                            } else {
                              return Text('No image URL available');
                            }
                          },
                          ),
                        Text('${match['competition']['name']}'),
                            ]
                          ),

                      SizedBox(width: 20),
                      Text('Matchday ${match['matchday']}'),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          SizedBox(width: 100,),
                          Text('${match['homeTeam']['tla']} ${match['score']['fullTime']['home']}:${match['score']['fullTime']['away']} ${match['awayTeam']['tla']}')
                        ],
                      )
                    ],
                  ),
                  children: <Widget>[
                    // Content widgets inside the ExpansionTile
                    ListTile(
                      title: Text('Referee: ${match['referees'][0]['name']}'),
                    ),],
                ),

              );
              check++;
              }
              else{
                break;
              }

            }

            return SingleChildScrollView(
              child: Column(
                children: textWidgets,
              ),
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
