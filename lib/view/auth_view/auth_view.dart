import 'package:authentication_app/controller/facebook_sign.dart';
import 'package:authentication_app/controller/sign_controller.dart';
import 'package:authentication_app/view/phone_auth_view/enter_phon.dart';

import '../../controller/google_sign.dart';
import '../widgets/custom_text.dart';
import 'widgets/custom_auth_btns.dart';
import 'widgets/custom_auth_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with TickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    GoogleSignController googleSignController = Get.find();
    SignController signController = Get.find();
    FacebookSignController facebookSignController = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: TabBar(
            splashBorderRadius: BorderRadius.circular(8),
            indicatorColor: Colors.deepPurple.shade100,
            controller: tabController,
            tabs: [
              CustomText(text: 'Sign In', fontSize: 18),
              CustomText(text: 'Sign Up', fontSize: 18),
            ],
          ),
        ),
        Form(
          key: formkey,
          child: Container(
            width: 300,
            height: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: TabBarView(
              controller: tabController,
              children: [
                //sign in
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomAuthTextFiled(
                      isEmail: true,
                      controller: signController.signINemailTextController,
                    ),
                    const SizedBox(height: 10),
                    CustomAuthTextFiled(
                      controller: signController.signINpasswordTextController,
                      isEmail: false,
                      isVisible: true,
                    ),
                    const Spacer(),
                    CustomAuthBtns(
                      onTapFacebook: () {
                        facebookSignController.signInWithFacebook();
                      },
                      onTapPhone: () {
                        Get.to(() => EnterPhone());
                      },
                      onTapGoogle: () {
                        googleSignController.googleSign(context);
                      },
                      onTapSign: () {
                        if (formkey.currentState!.validate()) {
                          signController.signIn(context);
                        }
                      },
                    )
                  ],
                ),
                //sign up
                Column(
                  children: [
                    CustomAuthTextFiled(
                      controller: signController.signUPemailTextController,
                    ),
                    const SizedBox(height: 10),
                    CustomAuthTextFiled(
                      controller: signController.signUPpasswordTextController,
                      isEmail: false,
                      isVisible: false,
                    ),
                    const SizedBox(height: 10),
                    CustomAuthTextFiled(
                      controller: signController.confirmPasswordController,
                      isEmail: false,
                      isVisible: false,
                      isConfirmPassword: true,
                    ),
                    const Spacer(),
                    CustomAuthBtns(
                      isLogIn: false,
                      onTapFacebook: () {
                        facebookSignController.signInWithFacebook();
                      },
                      onTapPhone: () {
                        Get.to(() => EnterPhone());
                      },
                      onTapGoogle: () {
                        googleSignController.googleSign(context);
                      },
                      onTapSign: () {
                        if (formkey.currentState!.validate()) {
                          signController.signUp(context);
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
