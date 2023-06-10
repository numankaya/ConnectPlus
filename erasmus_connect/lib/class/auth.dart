import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthServiceMethods {
  final FirebaseAuth _auth;

  FirebaseAuthServiceMethods(this._auth);
  Future<void> signUpWithEmail({required String email, required String password, required BuildContext context}) async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async{
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email verification sended");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> LoginWithEmail({required String email, required String password, required BuildContext context}) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

}