import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseFireStoreMethods {
  final FirebaseFirestore _firebaseStore;
  FirebaseFireStoreMethods(this._firebaseStore);

  Future<void> CreateUser({required String uId, required String fullName, required String? mail}) async{
    try {
      await _firebaseStore.collection("users").doc(uId).set({
        "fullName": fullName,
        "mail": mail
      });
    } on FirebaseException catch (e) {
     print(e.message);
    }
  }

  Future<Map<String, dynamic>?> GetUser(String uId) async{
    try {
      var collection = FirebaseFirestore.instance.collection('users');
      var docSnapshot = await collection.doc(uId).get();
      var x = docSnapshot.data();
      print(x.runtimeType);
      if (docSnapshot.exists) {
        return x;
      }else {
        return null;
      }
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }

}