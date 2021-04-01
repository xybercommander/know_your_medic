import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:know_your_medic/helper/shared_preferences.dart';
import 'package:know_your_medic/modules/user_constants.dart';
import 'package:know_your_medic/views/home_page.dart';
import 'package:page_transition/page_transition.dart';

class AuthChecker extends StatefulWidget {
  final Stream userStream;
  AuthChecker(this.userStream);

  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: widget.userStream,
        builder: (context, snapshot) {
          if(snapshot.hasData) documentSnapshot = snapshot.data.docs[0];

          Future.delayed(Duration(seconds: 5), () {
            UserConstants.email = documentSnapshot['email'];
            UserConstants.name = documentSnapshot['name'];

            SharedPref.saveEmailSharedPreference(documentSnapshot['email']);
            SharedPref.saveNameSharedPreference(documentSnapshot['name']);

            Navigator.pushReplacement(context, PageTransition(child: HomePage(), type: PageTransitionType.fade));
          });

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}