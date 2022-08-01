import 'package:authentication_app/controller/sign_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import '../view/hi_from.dart';

SignController controller = Get.find();

class FacebookSignController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signInWithFacebook() async {
    controller.isLoading = true;

    final LoginResult login = await FacebookAuth.instance.login();

    final OAuthCredential credential =
        FacebookAuthProvider.credential(login.accessToken!.token);

    await auth.signInWithCredential(credential);

    controller.isLoading = false;
    Get.to(() => HiFrom(from: 'Facebook', isGoogle: false));
    update();
  }

  // LCA
  //login / credential / auth
}
