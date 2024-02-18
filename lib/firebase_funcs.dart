import 'package:firebase_auth/firebase_auth.dart';

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