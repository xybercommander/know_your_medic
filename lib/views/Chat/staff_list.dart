import 'package:flutter/material.dart';
import 'package:know_your_medic/services/database.dart';

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Consult Medical Experts', style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Quicksand-Bold',
            fontSize: 24
          ),),
      ),

      body: StreamBuilder(
        stream: databaseMethods.searchStaff(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset('assets/images/noImg.png'),
                      title: Text(snapshot.data.docs[index]['name']),
                      trailing: Icon(Icons.chat),
                    ),
                    Divider()
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}