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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers to avoid memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Form(
      key: login_key,
      child: Column(
        children: [
          SizedBox(height:150),
          TextFormField(
            controller: _emailController,

            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.red,
              ),

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Email';
              }
              return null;
            },

          ),
          SizedBox(height: 8,),
          TextFormField(
            obscureText: true,
            controller: _passwordController,

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

            onPressed: () async{


              if (login_key.currentState!.validate()) {
                int logInResult = await signIn(_emailController.text, _passwordController.text);

                if (logInResult==0){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logging in')),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to Log in')),
                  );

                }

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
