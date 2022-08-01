import 'package:authentication_app/view/widgets/custom_button.dart';
import 'package:authentication_app/view/widgets/custom_text.dart';
import 'package:authentication_app/view/widgets/merror_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/facebook_sign.dart';
import '../controller/google_sign.dart';
import 'authentication/enter_phon.dart';
import 'authentication/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  GoogleSignController controller = Get.find();
  FacebookSignController facebookController = Get.find();

  Home({Key? key}) : super(key: key);

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
                // color: Colors.amber,
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
                  text: 'Authentication',
                  color: Colors.white60,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //btns
            Positioned(
              left: 50,
              top: 300,
              child: MerrorField(
                child: Column(
                  children: [
                    //With email
                    CustomButton(
                      title: 'With Email',
                      function: () {
                        Get.to(() => SignUp());
                      },
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    //With google
                    CustomButton(
                        title: 'With Google',
                        function: () {
                          controller.googleSign();
                        },
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(height: 15),
                    //With Facebook
                    CustomButton(
                      title: 'With Facebook',
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      function: () {
                        facebookController.signInWithFacebook();
                      },
                    ),
                    const SizedBox(height: 15),
                    //With your number
                    CustomButton(
                      title: 'With your number',
                      child: const Icon(
                        Icons.code_outlined,
                        color: Colors.white,
                      ),
                      function: () {
                        Get.to(() => EnterPhone());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
