import 'package:flutter/material.dart';
import 'package:food_app/Services/networking.dart';
import 'package:food_app/utility/utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    NetWorking.currentUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Food App',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
