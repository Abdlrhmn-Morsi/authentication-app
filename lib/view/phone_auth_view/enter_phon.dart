import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/otp_controller.dart';
import '../widgets/custom_text.dart';

// ignore: must_be_immutable
class EnterPhone extends StatelessWidget {
  EnterPhone({Key? key}) : super(key: key);
  OtpController controller = Get.find();

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 0),
          CustomText(
            text: 'What is your phone number?',
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: 'please enter your phone number to',
            color: Colors.black,
            fontSize: 18,
          ),
          CustomText(
            text: 'verify your account',
            color: Colors.black,
            fontSize: 18,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Text(
                      generateCountryFlag() + ' +20',
                      style: TextStyle(fontSize: 16, letterSpacing: 2.0),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: GetBuilder<OtpController>(
                    builder: (controller) => Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: controller.phoneNumber,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        maxLines: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter yout phone number!';
                          } else if (value.length < 11) {
                            return 'Too short for a phone number!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
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
                controller.phonVerify();
                print(controller.phoneNumber);
              },
              child: CustomText(
                text: 'Next',
                color: Colors.white,
                fontSize: 16,
              ),
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
