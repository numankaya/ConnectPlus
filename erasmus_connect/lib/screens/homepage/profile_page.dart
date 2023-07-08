import 'dart:typed_data';

import 'package:erasmus_connect/core/app_export.dart';
import 'package:erasmus_connect/core/utils/utils.dart';
import 'package:erasmus_connect/models/connect_plus_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../registeration_login/edit_profile_screen/edit_profile_screen.dart';

class ProfilePage extends ConsumerWidget {
  Uint8List? _image;

  void SelectImage() async {
    Uint8List img = await PickImage(ImageSource.gallery);
    _image = img;
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConnectPlusUser user = ref.watch(userProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: _image != null
                              ? Image(image: MemoryImage(_image!))
                              : Image(
                                  image: AssetImage(
                                      "assets/images/Default_pp.png"),
                                )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: SelectImage,
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.deepOrange),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ))
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user.fullName!),
                  SizedBox(
                    height: 10,
                  ),
                  TextContainer(
                      page: EditProfilePage(),
                      widget:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nick : ${user.nickName!}"),
                          Text("Mail : ${user.mail!}"),
                          Text("Telefon Numarası : ${user.phone!}"),
                          Text("Okul : ${user.school!}"),
                          Text("Erasmus Okulu : ${user.erasmusSchool!}"),
                        ],
                      ),
                    )),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({super.key, required this.widget, required this.page});

  final Widget widget, page;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 170,
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
      ],
    ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder) => page));
            },
                icon: Icon(Icons.edit)
            ),
          ),
          widget,
        ],
      ),
    );
  }
}