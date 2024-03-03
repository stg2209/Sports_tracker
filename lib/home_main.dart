import 'package:flutter/material.dart';
import 'package:sports_tracker/firebase_funcs.dart';
import 'package:sports_tracker/home_tab.dart';
import 'package:sports_tracker/profile_tab.dart';
import 'package:sports_tracker/score_tab.dart';



class Home extends StatefulWidget {
  const Home({super.key});
  //final dynamic squad;

  //const Home({Key? key, required this.squad}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int selected_index=0;
  void _onTap(int index) {
    setState(() {
      selected_index = index;
    }
    );
  }
  var data= "entire_squad";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(width: 80),
            Image.asset(
              'Assets/bayern.png', // Replace 'your_image.png' with your actual image file path
              width: 35, // Adjust width as needed
              height: 35, // Adjust height as needed
            ),
            SizedBox(width: 8), // Add some spacing between the image and the text
            Text('FC Bayern Munich',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],

      ),
      body:
      Container(
        padding: EdgeInsets.all(25),
        child: _getBodyWidget(selected_index),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(

            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sensor_occupied),
            label: 'Profile',
          ),



        ],
        currentIndex: selected_index,
        selectedItemColor: Colors.red[700],

        onTap: _onTap,
      ),
      //floatingActionButton: selected_index == 0 ? Float() : null,


    );
  }
  Widget _getBodyWidget(int index) {
    switch (index) {
      case 0:
        // return Home_tab(squad:data);
        return Home_tab();
      case 1:
        return Score_tab();
      case 2:
        return Profile_tab();
      default:
        return SizedBox.shrink();
    }
  }
}







// class Float extends StatelessWidget {
//   const Float({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {},
//       child:Text("Add team",
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 15,
//           fontFamily: 'Teko',
//         ),),
//       backgroundColor: Colors.teal[400],
//
//     );
//   }
// }