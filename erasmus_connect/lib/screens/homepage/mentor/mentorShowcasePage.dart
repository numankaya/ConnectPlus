import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/database.dart';
import 'mentors.dart';

class MentorShowcasePage extends ConsumerWidget {
  const MentorShowcasePage({Key? key, required this.goToPage}) : super(key: key);

  final Function(int) goToPage;

  Future<Map<String, dynamic>?> getData(String uId) async {
    final Map<String, dynamic>? userCollection = await FirebaseFireStoreMethods(FirebaseFirestore.instance).GetUser(uId);
    return userCollection;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    final x = ref.watch(targetuId);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 235, 225),
      body: Column(
        children: [
          Stack(
            children: [
              FutureBuilder(
              future: getData(x),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: const CircularProgressIndicator()),
                    ],
                  );
                }else if(snapshot.hasError) {
                  return const Text("hata");
                }else {
                  snapshot.data!["fullName"];
                  return MentorShowCaseTop(width: width);
                }
              },
            ),
              Positioned(
                top: 30,
                left: 20,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                      ),
                      onPressed: () {
                        goToPage(10);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class MentorShowCaseTop extends StatelessWidget {
  const MentorShowCaseTop({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(width: width,
    height: 200,
    padding: EdgeInsets.only(top: 40, left: 50),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(255, 212, 161, 1),
          Color.fromRGBO(251, 141, 39, 1),
        ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
      ),
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60))
    ),
    child: Row(
      children: [
        Container(
        width: 100,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child:  Image(
              image: AssetImage(
                  "assets/images/Default_pp.png"),
            )),
          ),
        SizedBox(width: 15,),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Berk Çiçekler", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
              SizedBox(width:180, child: Row(children: [
                Text("@berkcicekler34", style: TextStyle(fontSize: 12),),
                Spacer(),
                Text("İstanbul")
              ],)),
              SizedBox(height: 2,),
              Text("Okul : asasdasd"),
              Text("erasmus okul : asdadsadssd"),
              SizedBox(height: 5,),
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 255, 0, 1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  SizedBox(width: 2,),
                  Text("Çevrimiçi"),
                ],
              ),
            ],
          ),
        )
      ],
    ),);
  }
}



/*FutureBuilder(
        future: getData(x),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: const CircularProgressIndicator()),
              ],
            );
          }else if(snapshot.hasError) {
            return const Text("hata");
          }else {
            return Text(snapshot.data!["fullName"]);
          }
        },
      ),*/