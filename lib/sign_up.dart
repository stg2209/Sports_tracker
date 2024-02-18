import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  //const Sign_up({super.key});
  final void Function(int) onTabChange;

  const Sign_up({Key? key, required this.onTabChange}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final signin_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      key: signin_key,
      child:Form(
        child: Column(
          children: [
            SizedBox(height:150),
            TextFormField(

              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),

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
                prefixIcon: Icon(Icons.person_2_outlined),

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },

            ),
            SizedBox(height: 8,),
            TextFormField(
              obscureText: true,

              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),

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
    );
  }
}
