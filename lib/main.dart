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
  fetchData();
  var entire_squad="getsquad()";
  print(entire_squad);
  runApp(MaterialApp(
    home: Home(squad:entire_squad),
    theme: ThemeData(
      fontFamily: 'Teko',
    ),
  ));

}











