import 'package:authentication_app/controller/sign_controller.dart';
import 'package:authentication_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPasswordView extends StatelessWidget {
   ForgetPasswordView({Key? key}) : super(key: key);
final SignController signController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const SizedBox(height: 0),
          CustomText(
            text: 'Please Enter Your Email',
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: 'to reset your password',
            color: Colors.black,
            fontSize: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: signController.emailResetController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Email!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.deepPurpleAccent, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            alignment: Alignment.bottomRight,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minWidth: 100,
              height: 50,
              onPressed: () {
                signController.resetPassword(context);
              },
              child: CustomText(
                text: 'Reset Password',
                color: Colors.white,
                fontSize: 16,
              ),
              color: Colors.deepPurple,
            ),
          ),
        ]));
  }
}
