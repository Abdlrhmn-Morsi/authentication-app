import 'package:authentication_app/view/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/sign_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/merror_field.dart';

class SignIn extends StatelessWidget {
  SignController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            //img
            Positioned(
              top: 100,
              child: Container(
                width: Get.width,
                height: 700,
                child: Image.asset(
                  'assets/images/caracter-1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //title
            Positioned(
              top: 250,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 50),
                child: CustomText(
                  text: 'Sign In',
                  color: Colors.white60,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //field
            Positioned(
              left: 50,
              top: 300,
              child: MerrorField(
                height: 280,
                child: GetBuilder<SignController>(
                  builder: (controller) => Column(
                    children: [
                      const SizedBox(height: 10),
                      CustomTextField(
                          hint: 'Enter your email',
                          function: (val) {
                            controller.suEmail = val;
                          }),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hint: 'Enter you password',
                          function: (val) {
                            controller.suPassword = val;
                          }),
                      const SizedBox(height: 10),
                      // second content
                      CustomText(
                        text:
                            'By selecting Agree and continue below,\ni agree to Terms of service and Privacy Policy',
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 15),
                      // btn
                      CustomButton(
                        title: 'Sign In',
                        isSign: true,
                        function: () {
                          controller.signUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //last title
            Positioned(
              bottom: 120,
              left: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 3,
                    decoration: const BoxDecoration(color: Colors.deepPurple),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUp());
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        text: 'Sign Up',
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 100,
                    height: 3,
                    decoration: const BoxDecoration(color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
