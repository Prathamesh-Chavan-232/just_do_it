import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('students');

  Future updateUserData(String name, String div, String rollNo) async {
    return await studentCollection.doc(uid).set({'name': name, 'roll_no': rollNo, 'div': div});
  }


  Stream<QuerySnapshot?> get students {
    return studentCollection.snapshots();
  }
}
