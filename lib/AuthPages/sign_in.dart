import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey!\nWelcome back!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Quicksand-Bold'
              ),
            ),
            Text(
              'Login to your account',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontFamily: 'Quicksand-SemiBold'
              ),
            ),
          ],
        ),
      ),
    );
  }
}