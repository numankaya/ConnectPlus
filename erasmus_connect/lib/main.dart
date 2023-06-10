import 'package:erasmus_connect/class/auth.dart';
import 'package:erasmus_connect/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  void SignUpUser() async {
    FirebaseAuthServiceMethods(FirebaseAuth.instance).signUpWithEmail(email: email.text, password: password.text, context: context);
  }

  void SignInUser() async {
    FirebaseAuthServiceMethods(FirebaseAuth.instance).LoginWithEmail(email: email.text, password: password.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
            ),
            ElevatedButton(onPressed: (){
              //AuthService().signIn(mail: mail.text, password: pass.text);
              print(email.text);
              print(password.text);
              SignInUser();
            }, child: Text("giriş"))
          ],
        ),
      ),
    );
  }
}

