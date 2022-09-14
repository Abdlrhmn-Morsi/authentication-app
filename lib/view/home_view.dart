import 'dart:ui';
import 'package:authentication_app/view/auth_view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/facebook_sign.dart';
import '../controller/google_sign.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  GoogleSignController controller = Get.find();
  FacebookSignController facebookController = Get.find();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/apiens.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const SizedBox(height: 65),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: const AuthView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
