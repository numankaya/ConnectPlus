import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreMethods {
  final FirebaseFirestore _firebaseStore;
  FirebaseFireStoreMethods(this._firebaseStore);

  Future<void> CreateUser(
      {required String uId,
      required String fullName,
      required String? mail}) async {
    try {
      // create user's data inside of firestore
      await _firebaseStore.collection("users").doc(uId).set({
        "fullName": fullName,
        "nickName": "",
        "mail": mail,
        "gender": "",
        "country": "",
        "phone": "",
        "country": "",
        "city": "",
        "type": "Öğrenci",
        "school": "",
        "erasmusSchool": "",
        "aboutMe": "",
        "lessons": "",
        "skills": ""
      });
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<bool> UpdateUser(
      {required String uId,
      required String fullName,
      required String nickName,
      required String gender,
      required String phone,
      required String country,
        required String city,
      required String type,
      required String school,
      required String erasmusSchool}) async {
    try {
      // create user's data inside of firestore
      await _firebaseStore.collection("users").doc(uId).update({
        "fullName": fullName,
        "nickName": nickName,
        "gender": gender,
        "phone": phone,
        "country": country,
        "city": city,
        "type": type,
        "school": school,
        "erasmusSchool": erasmusSchool
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> UpdateUserAbout({required String uId,
    required String aboutMe,
    required String skills,
    required String lessons
  }) async {
    try {
      // create user's data inside of firestore
      await _firebaseStore.collection("users").doc(uId).update({
        "aboutMe": aboutMe,
        "skills": skills,
        "lessons": lessons,
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<Map<String, dynamic>?> GetUser(String uId) async {
    // get user's data from firestore
    try {
      var collection = FirebaseFirestore.instance.collection('users');
      var docSnapshot = await collection.doc(uId).get();
      var x = docSnapshot.data();
      if (docSnapshot.exists) {
        return x;
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }
}
