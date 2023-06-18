import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/connect_plus_user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();

  Future<void> CreateProviderDatas() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final Map<String, dynamic>? userCollection =
        await FirebaseFireStoreMethods(FirebaseFirestore.instance)
            .GetUser(currentUser!.uid);
    ref.read(userProvider.notifier).ChangeUser(ConnectPlusUserUser(
        uId: currentUser!.uid,
        fullName: userCollection!["fullName"],
        mail: currentUser.email,
        phone: currentUser.phoneNumber,
        isMailVerified: currentUser.emailVerified));
    Navigator.of(context).pop();
  }

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
            decoration: InputDecoration(hintText: "Full name"),
          ),
          TextField(
            controller: mail,
            decoration: InputDecoration(hintText: "Mail"),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(hintText: "Password"),
          ),
          TextField(
            controller: passwordAgain,
            decoration: InputDecoration(hintText: "Password Again"),
          ),
          ElevatedButton(
              onPressed: () async {
                if (password.text == passwordAgain.text) {
                  final bool isSuccess =
                      await FirebaseAuthServiceMethods(FirebaseAuth.instance)
                          .signUpWithEmail(
                              fullName: fullName.text,
                              email: mail.text,
                              password: password.text,
                              context: context);
                  if (isSuccess) {
                    CreateProviderDatas();
                  }
                }
              },
              child: Text("Sign Up")),
          ElevatedButton(
              onPressed: () async {
                if (fullName.text.isNotEmpty) {
                  final bool isSuccess =
                      await FirebaseAuthServiceMethods(FirebaseAuth.instance)
                          .SignInWithGoogle(context,
                              fullName: fullName.text, isCreatingAcc: true);
                  if (isSuccess) {
                    CreateProviderDatas();
                  }
                }
              },
              child: Text("Sign Up with google"))
        ],
      ),
    );
  }
}
