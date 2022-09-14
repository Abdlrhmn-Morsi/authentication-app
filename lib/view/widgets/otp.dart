import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controller/otp_controller.dart';

// ignore: must_be_immutable
class OtpWidget extends StatelessWidget {
  OtpController controller = Get.find();

  OtpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (controller) => PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        textStyle: const TextStyle(color: Colors.white),
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 2,
          activeColor: Colors.black,
          activeFillColor: Colors.deepPurple,
          inactiveColor: Colors.black,
          inactiveFillColor: Colors.white,
          selectedColor: Colors.black,
          selectedFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          controller.otpCode.text = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
