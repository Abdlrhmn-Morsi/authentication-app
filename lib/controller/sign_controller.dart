import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/hi_from.dart';

class SignController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  final signINemailTextController = TextEditingController();
  final signINpasswordTextController = TextEditingController();
  final signUPemailTextController = TextEditingController();
  final signUPpasswordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = true;
  bool isVarified = false;

  Future<void> signUp() async {
    try {
      isLoading = true;
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email:signUPemailTextController.text ,
        password: signUPpasswordTextController.text,
      );
      isLoading = false;
      Get.to(() => HiFrom(from: 'SIGN UP'));
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    update();
  }

  Future<void> signIn() async {
    try {
      isLoading = true;
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: signINemailTextController.text,
        password: signINpasswordTextController.text,
      );
      isLoading = false;
      Get.to(() => HiFrom(from: 'SIGN IN'));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    update();
  }
}
