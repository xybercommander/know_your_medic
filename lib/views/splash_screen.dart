import 'dart:io';
import 'package:flutter/material.dart';
import 'package:know_your_medic/AuthPages/get_started.dart';
import 'package:know_your_medic/helper/shared_preferences.dart';
import 'package:know_your_medic/modules/user_constants.dart';
import 'package:know_your_medic/views/home_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  getLogState() async {
    bool log = await SharedPref.getUserLoggedInSharedPreference();

    setState(() {
      if(log == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = log;
      }
    }); 
  }

  @override
  void initState() {
    getLogState();

    //TODO CONTINUE FROM HERE
    Future.delayed(Duration(seconds: 4), () async {
      if(isLoggedIn) {
        UserConstants.email = await SharedPref.getEmailInSharedPreference();
        UserConstants.name = await SharedPref.getNameInSharedPreference();
        String imgPath = await SharedPref.getImgInSharedPreference();
        UserConstants.userImg = File(imgPath);
      }

      Navigator.pushReplacement(context, PageTransition(
        child: isLoggedIn ? HomePage(isLoggedIn: isLoggedIn,) : GetStarted(),
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