import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/Screens/homepage.dart';
import 'package:food_app/Screens/sign_up.dart';
import 'package:food_app/Screens/login_page.dart';
import 'package:food_app/Screens/splash_screen.dart';
import '../Services/networking.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
