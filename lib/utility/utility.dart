import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/homepage.dart';
import 'package:food_app/Screens/login_page.dart';
import 'package:food_app/Services/networking.dart';

class Utility{

   void showToastMessage( String message){
     Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


}