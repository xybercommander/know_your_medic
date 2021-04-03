import 'package:flutter/material.dart';
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
      body: Center(
        child: IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            medicApi.callSymptomsData();
          },
        ),
      )
    );
  }
}