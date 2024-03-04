import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_tracker/firebase_funcs.dart';
import 'package:sports_tracker/profile_tab.dart';
//import { getAuth, createUserWithEmailAndPassword } from 'firebase/auth';

// const auth = getAuth();
// createUserWithEmailAndPassword(auth, email, password)
//     .then((userCredential) => {
// // Signed up
// const user = userCredential.user;
// // ...
// })
//     .catch((error) => {
// const errorCode = error.code;
// const errorMessage = error.message;
// // ..
// });


class Login_form extends StatefulWidget {
  final void Function(int) onTabChange;

  const Login_form({Key? key, required this.onTabChange}) : super(key: key);
  //const Login_form({super.key});

  @override
  State<Login_form> createState() => _Login_formState();
}

class _Login_formState extends State<Login_form> {
  final login_key = GlobalKey<FormState>();
 // Profile_tab pt= Profile_tab();



  @override
  Widget build(BuildContext context) {
    return Center(
      child:Form(
      key: login_key,
      child: Column(
        children: [
          SizedBox(height:150),
          TextFormField(

            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.red,
              ),

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Username';
              }
              return null;
            },

          ),
          SizedBox(height: 8,),
          TextFormField(
            obscureText: true,

            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.password,
                color: Colors.red,
              ),

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },

          ),
          SizedBox(height: 8,),

          ElevatedButton(

            onPressed: (){


              if (login_key.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: Text("Login",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account ?"),
              TextButton(
                onPressed: (){
                  widget.onTabChange(1);
              },
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.red[700]
                  ),
                ),
              ),
            ],
      )

        ],
      ),
    ),
    );
  }
}
