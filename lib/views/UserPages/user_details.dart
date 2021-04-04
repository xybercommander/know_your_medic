import 'package:flutter/material.dart';
import 'package:know_your_medic/services/api.dart';

class UserDetails extends StatefulWidget {
  final List symptoms;
  // ignore: non_constant_identifier_names
  final List symptoms_ID;
  UserDetails(this.symptoms, this.symptoms_ID);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController ageTextEditingController = TextEditingController();
  int _radioValue = -1;


  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  int ageTypeConverter() {
    int age = int.parse(ageTextEditingController.text);
    int year = DateTime.now().year - age;
    return year;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(        
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width - 60,
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.symptoms.toString(), style: TextStyle(fontSize: 20),),
                  Text('Please enter the following details : ', style: TextStyle(fontSize: 20)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32,),
                    padding: EdgeInsets.symmetric(horizontal: 24,),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: TextField(
                      controller: ageTextEditingController,
                      style: TextStyle(fontFamily: 'Quicksand-SemiBold', color: Colors.grey[800]),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Age',
                        hintStyle: TextStyle(fontFamily: 'Quicksand-SemiBold', color: Colors.grey[400]),                          
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text('Male'),
                      Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text('Female'),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {                  
                      MedicApi().callIssueData(widget.symptoms_ID, ageTypeConverter(), _radioValue);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}