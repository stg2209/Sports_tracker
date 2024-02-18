import 'package:flutter/material.dart';
import 'package:sports_tracker/firebase_funcs.dart';

class Sign_up extends StatefulWidget {
  //const Sign_up({super.key});
  final void Function(int) onTabChange;

  const Sign_up({Key? key, required this.onTabChange}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final signin_key = GlobalKey<FormState>();

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
    return SingleChildScrollView(
      child:Center(

      child:Form(
        key: signin_key,
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
                  return 'Please enter email';
                }
                return null;
              },

            ),
            SizedBox(height: 8,),
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
              onPressed: (){
                if (signin_key.currentState!.validate()) {
                  if (signUp(_emailController.text, _passwordController.text)==0){
                    const AlertDialog(content: Text("Success"),
                    );
                  }
                  else{
                    const AlertDialog(content: Text("failed"),
                    );
                  }
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text("Sign up",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already got an account ?"),
                      TextButton(
                        onPressed: (){
                          widget.onTabChange(0);
                        },
                        child: Text(
                          "Login",
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
    )
    );
  }
}
