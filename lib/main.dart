import 'package:chat/login/Login_screen.dart';
import 'package:chat/Register/Register.dart';
import 'package:chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Login_Screen.routeName : (_) =>Login_Screen(),
        Register_Screen.routeName : (_) => Register_Screen()
      },
      initialRoute: Login_Screen.routeName,
    );
  }
}


