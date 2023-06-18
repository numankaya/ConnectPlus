import 'package:erasmus_connect/screens/account_screen/account_screen.dart';
import 'package:erasmus_connect/firebase_options.dart';
import 'package:erasmus_connect/screens/account_screen/sign_in_screen.dart';
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
  //isOnboardingShown = false;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    home: isOnboardingShown ? MyApp() : IntroductionAnimationScreen(),
  ));
}

final List<Widget> allPages = [PageOne(), AccountScreen()];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: LoginScreen(),
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

//
//
//--------------Daha Sonra Eklenecek Sayfalar-----------------//
//
//
class MyMainApp extends StatelessWidget {
  const MyMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connect Plus",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final pageIndex = ref.watch(pageIndexProvider);
          return allPages[pageIndex];
        },
      ),
      bottomNavigationBar: my_navigator_bar(),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("eklen oluştur"),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PageTwo()));
        },
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("selam bu sayfa 2"),
    );
  }
}
