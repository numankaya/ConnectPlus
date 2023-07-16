import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/models/connect_plus_user.dart';
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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 235, 225),
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 247, 235, 225),
        backgroundColor: Color.fromRGBO(255, 144, 34, 1),
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
              child: Center(child: Text("Mentorlar")),
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Container(
                height: 38,
                width: 38,
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
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where("type", isEqualTo: "Mentor")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    List<Widget> mywidgets = [];
                    var datas = snapshot.data!.docs;
                    for (int i = 0; i < datas.length; i++) {
                      mywidgets.add(SizedBox(
                        height: 10,
                      ));
                      mywidgets.add(MentorHolder(
                        goToPage: goToPage,
                        uId: datas[i].id,
                        fullName: datas[i]["fullName"],
                        nickName: datas[i]["nickName"],
                        school: datas[i]["school"],
                        erasmusSchool: datas[i]["erasmusSchool"],
                        country: datas[i]["country"],
                      ));
                    }
                    return Column(
                      children: mywidgets,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class MentorHolder extends ConsumerWidget {
  const MentorHolder(
      {Key? key,
      required this.goToPage,
      required this.uId,
      required this.fullName,
      required this.nickName,
      required this.school,
      required this.erasmusSchool,
      required this.country})
      : super(key: key);

  final Function(int) goToPage;
  final String uId, fullName, nickName, school, erasmusSchool, country;

  void OpenMentorShowCase(WidgetRef ref) {
    ref.read(targetuId.notifier).state = uId;
    goToPage(14);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
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
                child: SizedBox(
                  width: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
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
                                nickName,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12),
                                maxLines: 1,
                              ),
                              Spacer(),
                              Text(
                                "${country}",
                                style:
                                    TextStyle(overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              )
                            ],
                          )),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Okul : ${school}",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      Text(
                        "erasmus okul : ${erasmusSchool}",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
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
                ),
              )
            ],
          ),
        ),
        Positioned(
          child: IconButton(
              onPressed: () {
                ref.read(targetuId.notifier).state = uId;
                OpenMentorShowCase(ref);
              },
              icon: Icon(Icons.arrow_forward_outlined)),
          bottom: 0,
          right: 0,
        )
      ],
    );
  }
}

final targetuId = StateProvider<String>((ref) => "");

/*
Positioned(
child: IconButton(
onPressed: () {
ref.read(targetuId.notifier).state = uId;
print(uId);
OpenMentorShowCase(ref);
},
icon: Icon(Icons.arrow_forward_outlined)),
bottom: 0,
right: 0,
);*/
