import 'package:flutter/material.dart';
import 'package:know_your_medic/views/UserPages/user_issues_page.dart';

import 'package:know_your_medic/views/UserPages/user_symptoms_page.dart';
import 'package:know_your_medic/views/UserPages/user_profile_page.dart';

class UserNavigator extends StatefulWidget {
  @override
  _UserNavigatorState createState() => _UserNavigatorState();
}

class _UserNavigatorState extends State<UserNavigator> {
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = [UserSymptomsPage(), UserIssuesPage(), UserProfilePage()];
  int _selectedIndex = 0;


  setAppBarTitle(int index) {
    if (index == 0) return Text('Symptoms', style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Quicksand-Bold',
            fontSize: 24
          ),);
    if (index == 1) return Text('Issues', style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Quicksand-Bold',
            fontSize: 24
          ),);
    if (index == 2) return Text('Account', style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Quicksand-Bold',
            fontSize: 24
          ),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: setAppBarTitle(_selectedIndex)
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

      bottomNavigationBar: BottomNavigationBar(        
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
            pageController.animateToPage(_selectedIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.linearToEaseOut);
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.healing,
                color: _selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400]),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info,
                color: _selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400]),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded,
                color: _selectedIndex == 2
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400]),
            title: Container(),
          ),
        ],
      ),
    );
  }
}