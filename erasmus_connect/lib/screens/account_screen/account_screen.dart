import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'package:erasmus_connect/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/connect_plus_user.dart';
import '../../services/auth.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final x = ref.watch(userProvider);
    return x.fullName != "" ? UserAccountExistScreen() : UserAccountNotExistScreen();
  }
}

class UserAccountExistScreen extends ConsumerWidget { // this will show up if user logged in
  const UserAccountExistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome " + ref.read(userProvider).fullName),
          ElevatedButton(onPressed: () async{
            final isUserLogOut = await FirebaseAuthServiceMethods(FirebaseAuth.instance).SignOut(context);
            if (isUserLogOut) {
              ref.read(userProvider.notifier).LogOut();
            }
          }, child: Text("Log Out"))
        ],
      ),
    );
  }
}

class UserAccountNotExistScreen extends ConsumerWidget { // this will show up if user not logged in
  const UserAccountNotExistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen()));
      }, child: Text("Sign In")),
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
          }, child: Text("Sign Up")),
        ],
      ),
    );
  }
}


