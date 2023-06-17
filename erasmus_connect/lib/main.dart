<<<<<<< HEAD
import 'package:erasmus_connect/screens/account_screen/account_screen.dart';
import 'package:erasmus_connect/firebase_options.dart';
import 'package:erasmus_connect/screens/account_screen/sign_in_screen.dart';
import 'package:erasmus_connect/screens/onboarding_screen/animation_screens.dart';
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
    home: isOnboardingShown ? MyMainApp() : IntroductionAnimationScreen(),
  ));
}

final List<Widget> allPages = [pageOneTesting(), AccountScreen()];

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
        home: IntroductionAnimationScreen(),
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


class pageOneTesting extends StatelessWidget {
  const pageOneTesting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("eklen oluştur"),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => asdasd()));
        },
      ),
    );
  }
}

class asdasd extends StatelessWidget {
  const asdasd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("testing"),
      ),
    );
  }
}

class pageTwoTesting extends StatelessWidget {
  const pageTwoTesting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("selam bu sayfa 2"),
    );
  }
}
=======
import 'package:erasmus_connect/screens/account_screen/account_screen.dart';
import 'package:erasmus_connect/firebase_options.dart';
import 'package:erasmus_connect/widgets/bottom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final List<Widget> allPages = [
  pageOneTesting(),
  AccountScreen()
];

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
        home: Scaffold(
          appBar: AppBar(
            title: Text("Connect Plus", style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: Consumer(builder: (context, ref, child){
          final pageIndex = ref.watch(pageIndexProvider);
          return allPages[pageIndex];
          },
        ),
          bottomNavigationBar: my_navigator_bar(),
        ),

      ),
    );
  }
}

class pageOneTesting extends StatelessWidget {
  const pageOneTesting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("eklen oluştur"),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => asdasd()));
        },
      ),
    );
  }
}

class asdasd extends StatelessWidget {
  const asdasd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("testing"),),
    );
  }
}



class pageTwoTesting extends StatelessWidget {
  const pageTwoTesting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("selam bu sayfa 2"),
    );
  }
}
>>>>>>> 00b42af35570278faff8b287dadb6332a48931d8
