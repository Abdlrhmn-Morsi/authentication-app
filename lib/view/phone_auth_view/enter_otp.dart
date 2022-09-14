import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/otp_controller.dart';
import '../widgets/custom_text.dart';
import '../widgets/otp.dart';

// ignore: must_be_immutable
class EnterOtp extends StatelessWidget {
  dynamic verificationId;
  EnterOtp({
    Key? key,
    required this.verificationId,
  }) : super(key: key);
  OtpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 0),
            CustomText(
              text: 'Verify your phone number',
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            CustomText(
              text: 'Enter your 6 digit code numbers sent to',
              color: Colors.black,
              fontSize: 18,
            ),
            CustomText(
              text: '+20112345678',
              color: Colors.deepPurple,
              fontSize: 18,
            ),
            const SizedBox(height: 50),
            OtpWidget(),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minWidth: 100,
                height: 50,
                onPressed: () {
                  controller.codeSent(verificationId);
                },
                color: Colors.deepPurple,
                child: CustomText(
                  text: 'confirm',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
