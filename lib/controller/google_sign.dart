import 'package:authentication_app/controller/sign_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../view/hi_from.dart';

SignController controller = Get.find();

class GoogleSignController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignInAccount? user;

  Future googleSign() async {
    controller.isLoading = true;

    final googleAccount = await GoogleSignIn().signIn();
    user = googleAccount;

    final googleAuth = await googleAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await auth.signInWithCredential(credential);
    controller.isLoading = false;
    Get.to(() => HiFrom(from: 'Google', isGoogle: true));
    update();
  }

//AACA
//acount / auth / credencial / auth
}
