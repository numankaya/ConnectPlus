import 'package:erasmus_connect/screens/homepage/chatbot_page.dart';
import 'package:erasmus_connect/screens/homepage/main.dart';
import 'package:erasmus_connect/screens/homepage/profile_page.dart';
import 'package:erasmus_connect/screens/homepage/search_page.dart';
import 'package:erasmus_connect/screens/homepage/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late PageController pageController;
  List<IconData> data = [
    Icons.question_answer_outlined,
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 235, 225),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          ChatbotPage(),
          SearchPage(),
          HomePageWidget(),
          SettingsPage(),
          ProfilePage(),
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
              Color.fromARGB(255, 255, 231, 160),
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
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      pageController.animateToPage(
                        i,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
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
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
