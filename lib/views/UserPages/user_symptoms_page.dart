import 'package:flutter/material.dart';
import 'package:know_your_medic/modules/symptoms_module.dart';
import 'package:know_your_medic/services/api.dart';
import 'package:know_your_medic/views/UserPages/user_details.dart';
import 'package:page_transition/page_transition.dart';

class UserSymptomsPage extends StatefulWidget {
  @override
  _UserSymptomsPageState createState() => _UserSymptomsPageState();
}

class _UserSymptomsPageState extends State<UserSymptomsPage> {
  MedicApi medicApi = MedicApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        physics: BouncingScrollPhysics(),
        itemCount: Symptoms.symptoms.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
               PageTransition(
                 child: UserDetails(Symptoms.symptoms[index]['Name'], index), 
                 type: PageTransitionType.bottomToTop
                )
            ),
            child: Hero(
              tag: 'container-$index',
              child: Card(              
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    Symptoms.symptoms[index]['Name'],
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand-SemiBold'),                
                  )
                ),
              ),
            ),
          );
        },
      )
    );
  }
}