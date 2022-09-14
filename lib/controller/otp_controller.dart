import 'package:authentication_app/controller/sign_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../view/hi_from.dart';
import '../view/phone_auth_view/enter_otp.dart';

SignController controller = Get.find();

class OtpController extends GetxController {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void phonVerify() async {
    
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2${phoneNumber.text}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print('${e}=================');
      },
      codeSent: (String verificationId, int? resendToken) async {
        Get.to(() => EnterOtp(verificationId: verificationId));

        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    update();
  }

  void codeSent(verificationId) async {
    controller.isLoading = true;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode.text);
    await auth.signInWithCredential(credential);
    
    controller.isLoading = false;
    Get.to(() => HiFrom(from: 'OtP'));
    update();
  }
}
