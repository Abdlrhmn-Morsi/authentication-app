import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/google_sign.dart';
import '../controller/sign_controller.dart';

// ignore: must_be_immutable
class HiFrom extends StatelessWidget {
  SignController controller = Get.find();
  bool isGoogle;
  dynamic from;
  HiFrom({
    Key? key,
    this.isGoogle = false,
    required this.from,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/apiens.png'), fit: BoxFit.cover),
      ),
      child: Center(
        child: GetBuilder<GoogleSignController>(
          builder: (controller) => isGoogle
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const SizedBox(height: 250),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        controller.user!.photoUrl.toString(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Hello from $from',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Name : ${controller.user!.displayName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Email : ${controller.user!.email}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'Hello from $from',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
        ),
      ),
    ));
  }
}
