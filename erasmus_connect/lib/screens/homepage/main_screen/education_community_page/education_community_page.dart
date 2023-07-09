import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/core/app_export.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/education_community_page/event_brite_api.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/education_community_page/image_upload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/education_community_page/image_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class EducationCommunityPage extends StatefulWidget {
  final Function(int) goToPage;

  const EducationCommunityPage({required this.goToPage, Key? key})
      : super(key: key);

  @override
  _EducationCommunityPageState createState() => _EducationCommunityPageState();
}

class _EducationCommunityPageState extends State<EducationCommunityPage> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, dynamic>> likedItems = [];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _pageController = PageController(initialPage: _currentPage);
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void toggleLike(Map<String, dynamic> itemData) {
    setState(() {
      if (likedItems.contains(itemData)) {
        likedItems.remove(itemData);
      } else {
        likedItems.add(itemData);
      }
    });
  }

  // Future<void> getLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );
  //     print('Latitude: ${position.latitude}');
  //     print('Longitude: ${position.longitude}');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  String _currentAddress = "";

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print('Service disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(41.025503, 28.974145);
      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.country} ${place.locality}, ${place.street}";
      });
      print(_currentAddress.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height * 0.12,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventListPage(),
                  ),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
          title: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/flags_0.png'),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Senin lokasyonun",
                    style: TextStyle(fontSize: 10.0),
                  ),
                  Text(
                    "${_currentAddress}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () async {
                    // _currentLocation = await _getCurrentLocation();
                    // setState(() {
                    //   _currentAddress = "${_currentLocation!.latitude}, "
                    //       "${_currentLocation!.longitude}";
                    // });
                    // print(_currentAddress.toString());
                    _currentLocation = await _getCurrentLocation();
                    await _getAddressFromCoordinates();
                    print("${_currentLocation}");
                    print("${_currentAddress}");
                  },
                  icon: Icon(
                    Icons.location_pin,
                    color: Color.fromARGB(255, 0, 186, 186),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 228, 115, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Set the desired border radius here
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 247, 235, 225),
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildMainPage();
                } else if (index == 1) {
                  return buildLikedItemsPage();
                }
                return Container();
              },
            ),
            Positioned(
              bottom: 16.0, // Adjust the bottom margin as per your requirement
              right: 16.0, // Adjust the right margin as per your requirement
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 188, 212),
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 29, 29, 29).withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.add),
                  onPressed: () => widget.goToPage(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainPage() {
    return Column(
      children: [
        Text("Trendler"),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _fireStore
                .collection('events')
                .orderBy('created', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              }
              final educationCommunityPages = snapshot.data!.docs;

              return ListView.builder(
                itemCount: educationCommunityPages.length,
                itemBuilder: (context, index) {
                  final data = educationCommunityPages[index].data()
                      as Map<String, dynamic>;
                  final date = data['date'] ?? '';
                  final place = data['place'] ?? '';
                  final event = data['event'] ?? '';
                  final time = data['time'] ?? '';
                  final loggedIn = data['sender'] ?? '';
                  final currentUser = loggedInUser.email ?? '';
                  final isLiked = likedItems.contains(data);

                  return MessageBubble(
                    date: date,
                    place: place,
                    event: event,
                    time: time,
                    isLoggedIn: currentUser == loggedIn,
                    isLiked: isLiked,
                    onLikePressed: () => toggleLike(data),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildLikedItemsPage() {
    return Column(
      children: [
        Text("Favorilerim"),
        Expanded(
          child: ListView.builder(
            itemCount: likedItems.length,
            itemBuilder: (context, index) {
              final data = likedItems[index];
              final date = data['date'] ?? '';
              final place = data['place'] ?? '';
              final event = data['event'] ?? '';
              final time = data['time'] ?? '';
              final loggedIn = data['sender'] ?? '';
              final currentUser = loggedInUser.email ?? '';

              return MessageBubble(
                date: date,
                place: place,
                event: event,
                time: time,
                isLoggedIn: currentUser == loggedIn,
                isLiked: true,
                onLikePressed: () => toggleLike(data),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.isLoggedIn,
    required this.isLiked,
    required this.date,
    required this.event,
    required this.time,
    required this.place,
    required this.onLikePressed,
  });

  final bool isLoggedIn;
  final bool isLiked;
  final String date;
  final String event;
  final String time;
  final String place;
  final VoidCallback onLikePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: ShaderMask(
                shaderCallback: (bound) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromARGB(255, 190, 190, 190).withOpacity(0),
                      Color.fromARGB(255, 133, 133, 133),
                    ],
                  ).createShader(bound);
                },
                blendMode: BlendMode.srcOver,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/turkey_accommodation.png"),
                      fit: BoxFit.cover,
                    ),
                    //tileMode: TileMode.,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.01,
            right: MediaQuery.of(context).size.width * 0.06,
            child: IconButton(
              onPressed: onLikePressed,
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.06,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event,
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 0, 186, 186),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          place,
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$time $date',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/flags_1.png'),
                        radius: 10,
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/flags_2.png'),
                        radius: 10,
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/flags_3.png'),
                        radius: 10,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '+5',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCreatorPage extends StatefulWidget {
  final Function(int) goToPage;
  const EventCreatorPage({required this.goToPage, Key? key}) : super(key: key);

  @override
  _EventCreatorPageState createState() => _EventCreatorPageState();
}

class _EventCreatorPageState extends State<EventCreatorPage> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  late String date;
  late String event;
  late String time;
  late String place;
  late TextEditingController dateTextController;
  late TextEditingController placeTextController;
  late TextEditingController eventTextController;
  late TextEditingController timeTextController;

  final picker = ImagePicker();
  PickedFile? _imageFile;
  String? downloadUrl;
  List<String> imageUrls = [];

  Future chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile != null ? PickedFile(pickedFile.path) : null;
    });
  }

  Future uploadImage() async {
    if (_imageFile != null) {
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child(
                'images/${DateTime.now().toString()}',
              );
      firebase_storage.UploadTask uploadTask = ref.putFile(
        File(_imageFile!.path),
      );

      firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() {});

      downloadUrl = await ref.getDownloadURL();
      print('Image uploaded. Download URL: $downloadUrl');
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('imageUrls', imageUrls);
      // TODO: Store the download URL in a database or use it as needed
      imageUrls.add(downloadUrl!);
      setState(() {});
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
  // @override
  // void initState() {
  //   super.initState();
  //   // Retrieve image URLs from shared preferences
  //   retrieveImageUrls();
  // }

  Future<void> retrieveImageUrls() async {
    final prefs = await SharedPreferences.getInstance();
    final storedImageUrls = prefs.getStringList('imageUrls');
    if (storedImageUrls != null) {
      setState(() {
        imageUrls = storedImageUrls;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    retrieveImageUrls();
    dateTextController = TextEditingController();
    placeTextController = TextEditingController();
    eventTextController = TextEditingController();
    timeTextController = TextEditingController();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    dateTextController.dispose();
    placeTextController.dispose();
    eventTextController.dispose();
    timeTextController.dispose();
    super.dispose();
  }

  void logout() {
    // _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/event_background_image.png"),
              fit: BoxFit.cover,
              opacity: 0.7,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.only(top: 16.0, right: 16.0),
                    child: IconButton(
                      onPressed: () {
                        widget.goToPage(12);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                      iconSize: 24.0,
                      padding: EdgeInsets.only(left: 8.0),
                      splashRadius: 24.0,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Etkinlik Oluştur',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 140.0, 24.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildTextField(
                        controller: eventTextController,
                        hintText: 'Başlık',
                      ),
                      SizedBox(height: 24.0),
                      buildTextField(
                        controller: dateTextController,
                        hintText: 'Tarih',
                      ),
                      SizedBox(height: 24.0),
                      buildTextField(
                        controller: placeTextController,
                        hintText: 'Konum',
                      ),
                      SizedBox(height: 24.0),
                      buildTextField(
                        controller: timeTextController,
                        hintText: 'Saat',
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _imageFile == null
                              ? Text('No image selected')
                              : Image.file(
                                  File(_imageFile!.path),
                                  height: 200,
                                ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: chooseImage,
                            child: Text('Select Image'),
                          ),
                          // SizedBox(height: 20),
                          // ElevatedButton(
                          //   onPressed: uploadImage,
                          //   child: Text('Upload Image'),
                          // ),
                          // Container(
                          //   child: downloadUrl != null
                          //       ? Image.network(downloadUrl!)
                          //       : Text('Image will be displayed here'),
                          // ),
                          ////////////////////////////////////////////////////////////////////////
                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) =>
                          //               ImageListPage(imageUrls: imageUrls)),
                          //     );
                          //   },
                          //   child: Text('Image List'),
                          // ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            _fireStore.collection('events').add({
                              'date': date,
                              'event': event,
                              'place': place,
                              'time': time,
                              'sender': loggedInUser.email,
                              'created': Timestamp.now(),
                            });
                            uploadImage();
                            dateTextController.clear();
                            placeTextController.clear();
                            eventTextController.clear();
                            timeTextController.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 50),
                            backgroundColor: Color.fromARGB(255, 135, 69, 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            'Oluştur',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () => widget.goToPage(12),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 50),
                            backgroundColor: Color.fromARGB(255, 135, 69, 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            'Etkinlikleri Görüntüle',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageUploadPage()));
                        },
                        child: Text('Resim Yükle'),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (hintText == 'Başlık') {
          event = value;
        } else if (hintText == 'Tarih') {
          date = value;
        } else if (hintText == 'Konum') {
          place = value;
        } else if (hintText == 'Saat') {
          time = value;
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        hintText: hintText,
        filled: true,
        fillColor: Colors.orange.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.brown),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.brown),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.brown),
        ),
      ),
    );
  }
}
