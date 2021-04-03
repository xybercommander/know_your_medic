import 'dart:io';
import 'package:flutter/material.dart';
import 'package:know_your_medic/AuthPages/get_started.dart';
import 'package:know_your_medic/helper/shared_preferences.dart';
import 'package:know_your_medic/modules/staff_constants.dart';
import 'package:know_your_medic/modules/user_constants.dart';
import 'package:know_your_medic/views/StaffPages/staff_home_page.dart';
import 'package:know_your_medic/views/UserPages/user_home_page.dart';
import 'package:know_your_medic/views/UserPages/user_profile_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  bool isStaff = false;

  getLogAndStaffState() async {
    bool log = await SharedPref.getUserLoggedInSharedPreference();
    bool staff = await SharedPref.getIsStaffInSharedPreference();

    setState(() {
      if(log == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = log;
      }

      if(staff == null) {
        isStaff = false;
      } else {
        isStaff = staff;
      }
    }); 
  }

  @override
  void initState() {
    getLogAndStaffState();

    Future.delayed(Duration(seconds: 4), () async {
      if(isLoggedIn && isStaff == false) {
        UserConstants.email = await SharedPref.getEmailInSharedPreference();
        UserConstants.name = await SharedPref.getNameInSharedPreference();
        UserConstants.imgUrl = await SharedPref.getImgInSharedPreference();        
      } else if(isLoggedIn && isStaff == false) {
        StaffConstants.name = await SharedPref.getNameInSharedPreference();
        StaffConstants.email = await SharedPref.getEmailInSharedPreference();
      }

      Navigator.pushReplacement(context, PageTransition(
        child: !isLoggedIn 
        ? GetStarted() 
        : isStaff 
            ? StaffHomePage() 
            : UserProfilePage(),
        type: PageTransitionType.fade,
        duration: Duration(milliseconds: 400)
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hola!',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}