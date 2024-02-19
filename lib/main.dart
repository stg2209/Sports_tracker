import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sports_tracker/firebase_funcs.dart';
import 'package:sports_tracker/firebase_options.dart';
import 'package:sports_tracker/home_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future <void> main() async {


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      fontFamily: 'Teko',
    ),
  ));
  fetchData();
}


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








