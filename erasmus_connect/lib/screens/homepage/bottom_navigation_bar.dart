import 'package:erasmus_connect/models/connect_plus_user.dart';
import 'package:erasmus_connect/screens/homepage/chatbot/chatbot_page.dart';
import 'package:erasmus_connect/screens/homepage/homepage.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/accommodation_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/education_community_page/education_community_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/education_community_page/event_creator_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/health_insurance_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/residency_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/schools_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/travel_page.dart';
import 'package:erasmus_connect/screens/homepage/main_screen/visa_page.dart';
import 'package:erasmus_connect/screens/homepage/mentor/mentorShowcasePage.dart';
import 'package:erasmus_connect/screens/homepage/mentor/mentors.dart';
import 'package:erasmus_connect/screens/homepage/profile_page.dart';
import 'package:erasmus_connect/screens/homepage/search_page.dart';
import 'package:erasmus_connect/screens/homepage/settings_page.dart';
import 'package:erasmus_connect/screens/registeration_login/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends ConsumerState<BottomNavigation> {
  int selectedIndex = 2;
  late PageController pageController;
  List<IconData> data = [
    Icons.chat_bubble_rounded,
    Icons.search,
    Icons.home_filled,
    Icons.settings,
    Icons.person_2_rounded
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;

      if (index == 4 && ref.read(userProvider).fullName == "") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (builder) => LoginScreen()));
        Future.delayed(const Duration(milliseconds: 2500), () {
          setState(() {
            selectedIndex = 2;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 235, 225),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(), //Sürüklenememesi için
        children: [
          ChatbotPage(),
          SearchPage(),
          HomePage(goToPage: (index) {
            pageController.jumpToPage(index);
          }),
          SettingsPage(),
          ProfilePage(),
          TravelPage(),
          AccommodationPage(),
          SchoolsPage(goToPage: (index) {
            pageController.jumpToPage(index);
          }),
          VisaPage(goToPage: (index) {
            pageController.jumpToPage(index);
          }),
          ResidencyPage(goToPage: (index) {
            pageController.jumpToPage(index);
          }),
          MentorsPage(goToPage: (index) {
            pageController.jumpToPage(index);
          }), // 10. index
          HealthInsurancePage(goToPage: (index) {
            pageController.jumpToPage(index);
          }),
          EducationCommunityPage(goToPage: (index) {
            pageController.jumpToPage(index);
          }),
<<<<<<< HEAD
          EventCreatorPage(goToPage: (index) {
=======
          MentorShowcasePage(goToPage: (index) {
>>>>>>> 7c0514f716f2863873190843b2246f09db0765e7
            pageController.jumpToPage(index);
          }),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 217, 124, 20),
              Color.fromARGB(255, 251, 141, 39),
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(45),
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Color.fromARGB(255, 255, 144, 34),
              ),
              height: 70,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (ctx, i) {
                  if (i == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(i);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: 35,
                          decoration: BoxDecoration(
                            border: i == selectedIndex
                                ? Border(
                                    top: BorderSide(
                                      width: 3.0,
                                      color: Color.fromARGB(250, 250, 228, 206),
                                    ),
                                  )
                                : null,
                            gradient: i == selectedIndex
                                ? LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 255, 216, 178),
                                      Color.fromARGB(100, 255, 130, 40),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.center,
                                  )
                                : null,
                          ),
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  i == selectedIndex
                                      ? 'assets/images/homepage_img_9.png'
                                      : 'assets/images/homepage_img_10.png',
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(i);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: 35,
                          decoration: BoxDecoration(
                            border: i == selectedIndex
                                ? Border(
                                    top: BorderSide(
                                      width: 3.0,
                                      color: Color.fromARGB(250, 250, 228, 206),
                                    ),
                                  )
                                : null,
                            gradient: i == selectedIndex
                                ? LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 255, 216, 178),
                                      Color.fromARGB(100, 255, 130, 40),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.center,
                                  )
                                : null,
                          ),
                          child: Icon(
                            data[i],
                            size: 35,
                            color: i == selectedIndex
                                ? Colors.black
                                : Color.fromARGB(255, 145, 85, 61),
                          ),
                        ),
                      ),
                    );
                  }
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

