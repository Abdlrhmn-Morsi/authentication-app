import 'package:authentication_app/controller/sign_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../view/hi_from.dart';

SignController controller = Get.find();

class GoogleSignController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignInAccount? user;

  Future googleSign(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple,
        ),
      ),
    );
    final googleAccount = await GoogleSignIn().signIn();
    user = googleAccount;

    final googleAuth = await googleAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await auth.signInWithCredential(credential);
    Navigator.pop(context);
    Get.to(() => HiFrom(from: 'Google', isGoogle: true));
    update();
  }

//AACA
//acount / auth / credencial / auth
}
