import 'package:flutter/material.dart';

import 'package:know_your_medic/views/UserPages/user_home_page.dart';
import 'package:know_your_medic/views/UserPages/user_profile_page.dart';

class UserNavigator extends StatefulWidget {
  @override
  _UserNavigatorState createState() => _UserNavigatorState();
}

class _UserNavigatorState extends State<UserNavigator> {
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = [UserHomePage(), UserProfilePage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Appbar',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Quicksand-Bold',
            fontSize: 24
          ),
        ),
      ),

      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        children: pages,
      ),
    );
  }
}