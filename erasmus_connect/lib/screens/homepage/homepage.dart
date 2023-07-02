import 'package:erasmus_connect/screens/homepage/main_screen/accommodation_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/schools_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/travel_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function(int) goToPage;
  HomePage({required this.goToPage});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 235, 225),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          backgroundColor: Color.fromARGB(255, 238, 217, 198),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // Handle button 1 press
                        },
                        child: Text(
                          'Erasmus',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 64, 58, 122),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          backgroundColor: Color.fromARGB(255, 238, 217, 198),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // Handle button 2 press
                        },
                        child: Text(
                          'Work & Travel',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 64, 58, 122),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(
                              0, 3), // controls the position of the shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage('assets/images/notifications_img.png'),
                      backgroundColor: Color.fromARGB(255, 253, 227, 205),
                      child: IconButton(
                        color: Color.fromARGB(255, 253, 227, 205),
                        onPressed: () {},
                        icon: Icon(Icons.notification_add_outlined),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 10,
                  bottom: 4,
                ),
                child: Text(
                  "Başvuru Rehberi",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 100, // Set the desired height for the images
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            goToPage(8);
                          },
                          child: Stack(
                            children: [
                              Image.asset('assets/images/homepage_img_4.png'),
                              Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Vize Süreçleri',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            goToPage(9);
                          },
                          child: Stack(
                            children: [
                              Image.asset('assets/images/homepage_img_2.png'),
                              Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Oturum İzni',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            // Handle grid card 1 press
                          },
                          child: Stack(
                            children: [
                              Image.asset('assets/images/homepage_img_1.png'),
                              Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sağlık\nSigortaları',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            // Handle grid card 3 press
                          },
                          child: Stack(
                            children: [
                              Image.asset('assets/images/homepage_img_3.png'),
                              Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kaliteli Eğitim\nTopluluğu',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  "Önerilenler",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        goToPage(6);
                      },
                      child: Stack(
                        children: [
                          Image.asset('assets/images/homepage_img_8.png'),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Konaklama\nTavsiyeleri',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        goToPage(7);
                      },
                      child: Stack(
                        children: [
                          Image.asset('assets/images/homepage_img_5.png'),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Okullar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        goToPage(5);
                      },
                      child: Stack(
                        children: [
                          Image.asset('assets/images/homepage_img_6.png'),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Gezilecek\nRotalar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle grid card 1 press
                      },
                      child: Stack(
                        children: [
                          Image.asset('assets/images/homepage_img_7.png'),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Mentorluk',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
