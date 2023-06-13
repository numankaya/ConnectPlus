import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/connect_plus_user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';


class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<SignInScreen> {

  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mail.dispose();
    password.dispose();
  }

  Future<void> CreateProviderDatas() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final Map<String, dynamic>? userCollection = await FirebaseFireStoreMethods(FirebaseFirestore.instance).GetUser(currentUser!.uid);
    ref.read(userProvider.notifier).ChangeUser(ConnectPlusUserUser(uId: currentUser!.uid, fullName: userCollection!["fullName"], mail: currentUser.email, phone: currentUser.phoneNumber, isMailVerified: currentUser.emailVerified));
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
          ElevatedButton(onPressed: () async{
            final bool x = await FirebaseAuthServiceMethods(FirebaseAuth.instance).SignInWithEmail(
                email: mail.text, password: password.text, context: context);
            if (x) {
              CreateProviderDatas();
            }
          }, child: Text("Sign in")),
          ElevatedButton(onPressed: () async{
            final bool x = await FirebaseAuthServiceMethods(FirebaseAuth.instance).SignInWithGoogle(context, isCreatingAcc: false);
            if (x) {
              CreateProviderDatas();
            }
          }, child: Text("Sign in with google"))
        ],
      ),
    );
  }
}
