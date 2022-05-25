import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../models/user.dart' as model;
import 'dart:io';

import '../views/screens/auth/login_screen.dart';
import '../views/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => SignInScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print("Log sucess");
      } else {
        Get.snackbar("Error Logging in", "Please enter all the feilds");
      }
    } catch (e) {
      Get.snackbar("Error Creating an account", e.toString());
    }
  }
}
