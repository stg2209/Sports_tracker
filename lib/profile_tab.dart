import 'package:flutter/material.dart';
import 'package:sports_tracker/login_form.dart';
import 'package:sports_tracker/sign_up.dart';

class Profile_tab extends StatefulWidget {
  const Profile_tab({Key? key}) : super(key: key);

  @override
  State<Profile_tab> createState() => _Profile_tabState();


}


class _Profile_tabState extends State<Profile_tab> {
   int selected_index=0;
    void change (int index) {
      setState(() {
        selected_index = index;
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      child: _getBodyWidget(selected_index),
    );

  }
  Widget _getBodyWidget(int index) {
    switch (index) {
      case 0:
        return Login_form(onTabChange: change);
      case 1:
        return Sign_up(onTabChange: change);
      default:
        return SizedBox.shrink();
    }
  }
}
