import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(school) async {
    FirebaseFirestore.instance.collection("school").add(school).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("school").get();
  }
}
