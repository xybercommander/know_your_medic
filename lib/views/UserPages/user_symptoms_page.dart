import 'package:flutter/material.dart';
import 'package:know_your_medic/modules/symptoms_module.dart';
import 'package:know_your_medic/services/api.dart';

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
        physics: BouncingScrollPhysics(),
        itemCount: Symptoms.symptoms.length,
        itemBuilder: (context, index) {
          return ListTile(          
            title: Text(Symptoms.symptoms[index]['Name']),
          );
        },
      )
    );
  }
}