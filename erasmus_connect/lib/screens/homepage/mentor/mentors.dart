import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/screens/homepage/mentor/mentorShowcasePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MentorsPage extends StatelessWidget {
  const MentorsPage({
    Key? key,
    required this.goToPage,
  }) : super(key: key);

  final Function(int) goToPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 235, 225),
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 247, 235, 225),
        backgroundColor: Color.fromARGB(255, 247, 235, 225),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Container(
                height: 38,
                width: 38,
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
                    goToPage(2);
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 70),
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Mentorlar")),
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.chat_outlined,
                    size: 25,
                  ),
                  onPressed: () {
                    goToPage(2);
                  },
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
<<<<<<< HEAD
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      filled: true,
                      fillColor: Color.fromARGB(255, 250, 229, 210),
                      hintText: 'Ara...',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 237, 164, 126),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 237, 164, 126),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      // Handle search bar input
                    },
                    autofocus: false,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(
                        255, 250, 229, 210), // Background color of the button
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      // Add your onTap logic here
                    },
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/images/filter_img.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              ],
=======
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    filled: true,
                    fillColor: Color.fromARGB(255, 250, 229, 210),
                    hintText: 'Ara...',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 237, 164, 126),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 237, 164, 126),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    // Handle search bar input
                  },
                  autofocus: false,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 250, 229,
                      210), // Background color of the button
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    // Add your onTap logic here
                  },
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Image.asset(
                      'assets/images/filter_img.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("users").where("type", isEqualTo:"Mentor").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }else {
                  List<Widget> mywidgets = [];
                  var datas = snapshot.data!.docs;
                  for(int i = 0; i < datas.length; i++) {
                        mywidgets.add(SizedBox(height: 10,));
                        mywidgets.add(MentorHolder(goToPage: goToPage, uId: datas[i].id, fullName: datas[i]["fullName"], nickName: datas[i]["nickName"], school: datas[i]["school"], erasmusSchool: datas[i]["erasmusSchool"]));
                  }
                  return Column(
                    children: mywidgets,
                  );
                }
              },
>>>>>>> 7c0514f716f2863873190843b2246f09db0765e7
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  MentorHolder(),
                  SizedBox(
                    height: 15,
                  ),
                  MentorHolder(),
                  SizedBox(
                    height: 15,
                  ),
                  MentorHolder(),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MentorHolder extends ConsumerWidget {
  const MentorHolder({Key? key, required this.goToPage, required this.uId, required this.fullName, required this.nickName, required this.school, required this.erasmusSchool}) : super(key: key);

  final Function(int) goToPage;
  final String uId, fullName, nickName, school, erasmusSchool;

  void OpenMentorShowCase(WidgetRef ref) {
    ref.read(targetuId.notifier).state = uId;
    goToPage(13);
  }

  @override
<<<<<<< HEAD
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
=======
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [Container(
>>>>>>> 7c0514f716f2863873190843b2246f09db0765e7
        padding: EdgeInsets.all(10),
        width: 370,
        height: 150,
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 185, 155, 1),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage("assets/images/Default_pp.png"),
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
                  Text(
                    "Berk Çiçekler",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                      width: 180,
                      child: Row(
                        children: [
                          Text(
                            "@berkcicekler34",
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
                          Text("İstanbul")
                        ],
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Okul : asasdasd"),
                  Text("erasmus okul : asdadsadssd"),
                  SizedBox(
                    height: 5,
                  ),
=======
                  Text(fullName, style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 4,),
                  SizedBox(width:180, child: Row(children: [
                    Text(nickName, style: TextStyle(fontSize: 12),),
                    Spacer(),
                    Text("İstanbul")
                  ],)),
                  SizedBox(height: 2,),
                  Text("Okul : ${school}", maxLines: 2,),
                  Text("erasmus okul : ${erasmusSchool}"),
                  SizedBox(height: 5,),
>>>>>>> 7c0514f716f2863873190843b2246f09db0765e7
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 255, 0, 1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("Çevrimiçi"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
<<<<<<< HEAD
      Positioned(
        child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MentorShowcasePage()));
            },
            icon: Icon(Icons.arrow_forward_outlined)),
        right: 1,
        bottom: 1,
      )
    ]);
  }
}
=======
        Positioned(child:
        IconButton(onPressed: () {
          ref.read(targetuId.notifier).state = uId;
          print(uId);
          OpenMentorShowCase(ref);
        }, icon: Icon(Icons.arrow_forward_outlined)),
        bottom: 0, right: 0,)
      ]
    );
  }
}

final targetuId = StateProvider<String>((ref) => "");

>>>>>>> 7c0514f716f2863873190843b2246f09db0765e7
