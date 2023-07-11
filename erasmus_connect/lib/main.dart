import 'package:erasmus_connect/firebase_options.dart';
import 'package:erasmus_connect/screens/homepage/bottom_navigation_bar.dart';
import 'package:erasmus_connect/screens/onboarding_screen/animation_screens.dart';
import 'package:erasmus_connect/screens/registeration_login/login_screen/login_screen.dart';
import 'package:erasmus_connect/widgets/bottom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('isOnboardingShown');
  bool isOnboardingShown = prefs.getBool('isOnboardingShown') ?? false;
  isOnboardingShown = true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //runApp(MyApp());

  //--------------------------ÖNEMLİ--------------------------//
  // Bu kısım arayüz tarafını tamamladıktan sonra aktif edilecektir.
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  MyApp(isIntroduction : isOnboardingShown) ,
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isIntroduction});
  final bool isIntroduction;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Connect Plus',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: BottomNavigation(),
        //--------------------------ÖNEMLİ--------------------------//
        // Bu kısım arayüz tarafını tamamladıktan sonra aktif edilecektir.
        home: isIntroduction == true ? IntroductionAnimationScreen() : LoginScreen(),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: Text(
        //       "Connect Plus",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     backgroundColor: Colors.deepPurpleAccent,
        //   ),
        //   body: Consumer(
        //     builder: (context, ref, child) {
        //       final pageIndex = ref.watch(pageIndexProvider);
        //       return allPages[pageIndex];
        //     },
        //   ),
        //   bottomNavigationBar: my_navigator_bar(),
        // ),
      ),
    );
  }
}

