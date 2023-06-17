import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/screens/registeration_login/login_screen/login_screen.dart';
import '../../widgets/bottom_navigator_bar.dart';
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
    if (x.fullName != "") {
      return UserAccountExistScreen();
    }else {
      Future.delayed(Duration.zero, () async{
        bool? isLogined = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
        if (isLogined == null  || !isLogined) {
          ref.read(pageIndexProvider.notifier).state = 0;
        }
      });

      return CircularProgressIndicator();
    }

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




