import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//List<dynamic> entire_squad = [];


void fetch_data() async {
  const API_KEY = "12457496b72249c29dd458fe11268b2a";

  var headers = {"X-Auth-Token": API_KEY};

  final Uri squad = Uri.parse("https://api.football-data.org/v4/teams/5");

  final Uri points = Uri.parse("https://api.football-data.org/v4/competitions/2002/standings");

  final Uri matches = Uri.parse("https://api.football-data.org/v4/teams/5/matches/");

  final response_squad = await http.get(squad, headers :headers,);

  final response_points = await http.get(points, headers :headers,);

  final response_matches = await http.get(matches, headers :headers,);

  if (response_squad.statusCode == 200 && response_points.statusCode==200 && response_matches.statusCode==200) {
    // If the call to the server was successful, parse the JSON
    var data_squad = json.decode(response_squad.body);
    var data_points = json.decode(response_points.body);
    var data_matches = json.decode(response_matches.body);

    createRecord(data_squad['squad'],data_points['standings'][0]['table'],data_matches['matches']);



    //createRecord(data_points['standings'], "Points_table/");
    // print(data_points['standings'][0]['table']);

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data');
  }
}


// Sign Up
Future<int> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    // Handle successful sign up
    return 0; // Return 0 for success
  } catch (e) {
    print('Sign up failed: $e');
    // Handle sign up failure
    return -1; // Return -1 for failure
  }
}

Future<int> signIn(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    User? user = credential.user;
    return 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 1;
    } else if (e.code == 'wrong-password') {
      return -1;
    }
  }
}
//
// Future<Object?> getsquad(var squad) async {
//   FirebaseDatabase database = FirebaseDatabase.instance;
//   final ref = FirebaseDatabase.instance.ref();
//
//
//
//   try {
//   final snapshot = await ref.child('Squad').get();
//    var squad = snapshot.value;
//   }
//   catch (error) {
//   }
// }


// Object getData() {
//   final ref = FirebaseDatabase.instance.ref();
//   try {
//     // Perform the asynchronous operation without await
//     final snapshot = ref.child('Squad').get();
//
//     // Directly return the value without waiting for the future to complete
//     return snapshot.then((snapshot) => snapshot.value);
//   } catch (error) {
//     return [];
//   }
// }
void createRecord(var data_squad,var data_points , var data_matches) async{
  DatabaseReference ref_squad = FirebaseDatabase.instance.ref("Squad/");
  DatabaseReference ref_points = FirebaseDatabase.instance.ref("Points_table/");
  DatabaseReference ref_matches = FirebaseDatabase.instance.ref("Matches/");

  await ref_squad.set(data_squad);
  await ref_points.set(data_points);
  await ref_matches.set(data_matches);
}

