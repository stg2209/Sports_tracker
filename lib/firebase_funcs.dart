import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

var entire_squad;
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

Future<void> getData() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('Squad/0/name').get();

    entire_squad = snapshot.value;

  if (snapshot.exists) {
    print(snapshot.value);
  } else {
    print('No data available.');
  }
}


void createRecord(var data) async{
  DatabaseReference ref = FirebaseDatabase.instance.ref("Squad/");

  await ref.set(data);
}