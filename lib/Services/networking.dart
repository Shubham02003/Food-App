import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/homepage.dart';
import 'package:food_app/Screens/login_page.dart';
import 'package:firebase_database/firebase_database.dart';
class NetWorking {

  static final auth = FirebaseAuth.instance;
  // static final ref=FirebaseDatabase.instance.ref('foodData');
  static Future createNewUser(email, password) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future signWithEmailAndPasssword(email,password)async{
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future currentUser(BuildContext context)async{

    if(await auth.currentUser!=null){
      Timer(const Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())));
    }else{
      Timer(const Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())));
    }
  }
  static Future loggedOut()async{
    await auth.signOut();
  }

  // static Future FirebaseDataInstance()async{
  //   return await FirebaseDatabase.instance.ref('foodData');
  // }

}
