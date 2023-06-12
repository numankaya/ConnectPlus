import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/services/database.dart';
import 'package:erasmus_connect/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServiceMethods {
  final FirebaseAuth _auth;
  FirebaseAuthServiceMethods(this._auth);

  Future<bool> SignOut(BuildContext context) async{
    try {
      await _auth.signOut();
      return true;
    } on FirebaseException catch(e) {
      showSnackBar(context, e.message!);
      return false;
    }
  }

  Future<void> signUpWithEmail({required String fullName, required String email, required String password, required BuildContext context}) async{
    try {
      var res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await sendEmailVerification(context);
      showSnackBar(context, "We sended a verification mail!");
      if(_auth.currentUser != null) {
        FirebaseFireStoreMethods(FirebaseFirestore.instance).CreateUser(
            uId: _auth.currentUser!.uid,
            fullName: fullName,
            mail: _auth.currentUser!.email
        );
      }
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

  Future<void> SignInWithEmail({required String email, required String password, required BuildContext context}) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        //await sendEmailVerification(context);

      }
      print("giriş yapıldı");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> SignInWithGoogle(BuildContext context) async{
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null){
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        if(userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            // if the user signing in first time with his google account we can add what we want to do

          }else {

          }
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}