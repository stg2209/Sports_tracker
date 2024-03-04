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
  fetch_data();
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      fontFamily: 'Teko',
    ),
  ));

}











