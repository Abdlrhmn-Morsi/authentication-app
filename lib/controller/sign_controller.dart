import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/hi_from.dart';

class SignController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  final signINemailTextController = TextEditingController();
  final emailResetController = TextEditingController();
  final signINpasswordTextController = TextEditingController();
  final signUPemailTextController = TextEditingController();
  final signUPpasswordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = true;
  bool isVarified = false;

  Future<void> signUp(context) async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        ),
      );
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: signUPemailTextController.text,
        password: signUPpasswordTextController.text,
      );
      Navigator.pop(context);
      Get.to(() => HiFrom(from: 'SIGN UP'));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.message.toString()),
        ),
      );
    }

    update();
  }

  Future<void> signIn(context) async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        ),
      );
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: signINemailTextController.text,
        password: signINpasswordTextController.text,
      );
      Navigator.pop(context);

      Get.to(() => HiFrom(from: 'SIGN IN'));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            e.message.toString(),
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      );
    }
  }

  Future<void> resetPassword(context) async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        ),
      );
      await auth.sendPasswordResetEmail(
          email: emailResetController.text.trim());

      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content:  Text(
            'Password Reset link is sent!\nplease checkout your Email.',
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            e.message.toString(),
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      );
    }
  }
}
