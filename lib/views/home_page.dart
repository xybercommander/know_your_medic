import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:know_your_medic/AuthPages/sign_in.dart';
import 'package:know_your_medic/helper/shared_preferences.dart';
import 'package:know_your_medic/modules/user_constants.dart';
import 'package:know_your_medic/services/auth.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn;
  HomePage({this.isLoggedIn});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthMethods authMethods = AuthMethods();

  _logout() {
    authMethods.signOut()
      .then((_) {
        Navigator.pushReplacement(context, PageTransition(child: SignIn(), type: PageTransitionType.fade));
      });
  }

  // // ----------GETTING DATA FROM SHARED PREFERENCES---------- //
  // setCredentials() async {
  //   String imgPath = await SharedPref.getImgInSharedPreference();
  //   print('IMG PATH -------------> $imgPath');
  //   if(imgPath != null) UserConstants.imgUrl = imgPath;
  // }

  // @override
  // void initState() {
  //   setCredentials();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: UserConstants.imgUrl == null ?
                  AssetImage('assets/images/noImg.png') :
                  CachedNetworkImageProvider(UserConstants.imgUrl),
                  backgroundColor: Colors.transparent,
                  radius: 70,
            ),
            Text(UserConstants.name, style: TextStyle(fontSize: 20, color: Colors.black),),
            Text(UserConstants.email, style: TextStyle(fontSize: 20, color: Colors.black),),
            IconButton(
              onPressed: () {
                _logout();
                SharedPref.saveLoggedInSharedPreference(false);
                print('logging out');
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      )
    );
  }
}