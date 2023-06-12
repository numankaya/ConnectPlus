import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/connect_plus_user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController fullName = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: fullName,
            decoration: InputDecoration(
                hintText: "Full name"
            ),
          ),
          TextField(
            controller: mail,
            decoration: InputDecoration(
                hintText: "Mail"
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                hintText: "Password"
            ),
          ),
          TextField(
            controller: passwordAgain,
            decoration: InputDecoration(
                hintText: "Password Again"
            ),
          ),
          ElevatedButton(onPressed: () {
            print("burada");
            if (password.text == passwordAgain.text) {
              print("burada 2 2 ");
              FirebaseAuthServiceMethods(FirebaseAuth.instance).signUpWithEmail(fullName: fullName.text, email: mail.text, password: password.text, context: context);
            }
          }, child: Text("Sign Up")),
          ElevatedButton(onPressed: () {

          }, child: Text("Sign Up with google"))
        ],
      ),
    );
  }
}
