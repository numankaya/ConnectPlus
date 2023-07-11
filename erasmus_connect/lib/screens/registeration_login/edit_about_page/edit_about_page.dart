import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/models/connect_plus_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:searchfield/searchfield.dart';
import '../../../services/database.dart';

import '../../../core/utils/image_constant.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';

class EditAboutPage extends ConsumerStatefulWidget {
  const EditAboutPage({Key? key, required this.goToPage}) : super(key: key);

  final Function(int) goToPage;
  @override
  ConsumerState<EditAboutPage> createState() => _EditAboutPageState();
}

class _EditAboutPageState extends ConsumerState<EditAboutPage> {
  late TextEditingController aboutMe, skills, lessons;

  late ConnectPlusUser user;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ConnectPlusUser user = ref.read(userProvider);
    aboutMe = TextEditingController();
    skills = TextEditingController();
    lessons = TextEditingController();
    aboutMe.text = user.aboutMe!;
    skills.text = user.skills!;
    lessons.text = user.lessons!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    aboutMe.dispose();
    skills.dispose();
    lessons.dispose();
  }


  void UpdateProfile() async {
    ConnectPlusUser user = ref.read(userProvider);
    await FirebaseFireStoreMethods(FirebaseFirestore.instance)
        .UpdateUserAbout(
        uId: user.uId,
      aboutMe: aboutMe.text,
      skills: skills.text,
      lessons: lessons.text
)
        .then((value) {
      ref.read(userProvider.notifier).updateAboutStatus(aboutMe: aboutMe.text, skills: skills.text, lessons: lessons.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    CustomIconButton(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.all(2),
                        alignment: Alignment.centerLeft,
                        onTap: () {
                          widget.goToPage(4);
                        },
                        child: CustomImageView(
                            svgPath: ImageConstant.imgArrowleft)),
                    SizedBox(
                      width: 65,
                    ),
                    Text(
                      "Hakkımda",
                      style: TextStyle(fontFamily: "Intern", fontSize: 24),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: BerkLongTextField(
                  label: "Hakkımda",
                  controller: aboutMe,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BerkLongTextField(
                label: "Yetkinlikler",
                controller: skills,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: BerkLongTextField(
                  label: "Alınan Dersler",
                  controller: lessons,
                ),
              ),
              SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(left: 32),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(117, 117, 117, 1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(243, 248, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],),
                  child: Center(
                    child: Image(
                      image: AssetImage(
                          "assets/images/unicef.png"),
                    ),
                  )
                ),
              ],
            ),
              ElevatedButton(
                onPressed: () {
                  UpdateProfile();
                },
                child: Text("Kaydet"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    onPrimary: Colors.black
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BerkLongTextField extends StatelessWidget {
  const BerkLongTextField({Key? key, required this.label, required this.controller})
      : super(key: key);

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,

      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(117, 117, 117, 1), width: 2),
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(243, 248, 255, 1),
          boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
          ],
      ),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 1,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(
              color: Color.fromRGBO(127, 127, 127, 1),
              fontSize: 14,
              fontFamily: "Roboto"
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
            height: 1.3,
            color: Color.fromRGBO(33, 33, 33, 1),
            fontSize: 15,
            fontFamily: "Roboto"),
      ),
    );
  }
}