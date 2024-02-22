import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//List<dynamic> entire_squad = [];


void fetchData() async {
  const API_KEY = "12457496b72249c29dd458fe11268b2a";
  //final response = await http.get(Uri.parse('https://api.football-data.org/v4/teams/5'));
  final Uri uri = Uri.parse("https://api.football-data.org/v4/teams/5");
  //var url = "https://api.football-data.org/v4/teams/5";
  var headers = {"X-Auth-Token": API_KEY};
  //var params = {"season": season } ;

  final response = await http.get(uri, headers :headers,);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    var data = json.decode(response.body);
    //print(data['squad']);
    createRecord(data['squad']);
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
//
Object getsquad() async {
  FirebaseDatabase database = FirebaseDatabase.instance;
  final ref = FirebaseDatabase.instance.ref();



  try {
  final snapshot = await ref.child('Squad').get();
   var entire_squad = snapshot.value;
  // var entire_squad = sd;
   print(entire_squad);
    return entire_squad;
  }
  catch (error) {
    return null;
  }
}


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





void createRecord(var data) async{
  DatabaseReference ref = FirebaseDatabase.instance.ref("Squad/");

  await ref.set(data);
}