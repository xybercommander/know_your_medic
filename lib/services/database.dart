import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  // ---------SIGN UP INFO UPLOAD METHOD--------- //
  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  // ---------SIGN IN INFO GET METHOD--------- //
  Future<Stream<QuerySnapshot>> getUserInfoByEmail(String userEmail) async {
    return await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: userEmail)
      .snapshots();
  }


}