import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sports_tracker/firebase_options.dart';
import 'package:sports_tracker/login_form.dart';
import 'package:sports_tracker/home_main.dart';
import 'package:sports_tracker/home_tab.dart';
import 'package:sports_tracker/profile_tab.dart';
import 'package:sports_tracker/score_tab.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      fontFamily: 'Teko',
    ),
  ));
}






