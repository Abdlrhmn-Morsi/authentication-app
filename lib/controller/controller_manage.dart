
import 'package:authentication_app/controller/sign_controller.dart';
import 'package:get/get.dart';
import 'facebook_sign.dart';
import 'google_sign.dart';
import 'otp_controller.dart';

class ControllerManage {
  SignController signController = Get.put(SignController());
  GoogleSignController googleSignController = Get.put(GoogleSignController());
  OtpController otpController = Get.put(OtpController());
  FacebookSignController facebookSignController =
      Get.put(FacebookSignController());
 }
