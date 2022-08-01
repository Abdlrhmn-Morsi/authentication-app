import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../view/hi_from.dart';

class SignController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  dynamic suEmail;
  dynamic suPassword;
  dynamic siEmail;
  dynamic siPassword;
  bool isLoading = true;
  bool isVarified = false;

  Future<void> signUp() async {
    try {
      isLoading = true;
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: suEmail,
        password: suPassword,
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
        email: siEmail,
        password: siPassword,
      );
      isLoading = false;
      Get.to(() => HiFrom(from: 'SIGN IN'));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    update();
  }
}
