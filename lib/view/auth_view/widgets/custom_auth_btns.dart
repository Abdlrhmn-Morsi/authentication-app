// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/custom_text.dart';

class CustomAuthBtns extends StatelessWidget {
  bool isLogIn;
  dynamic onTapGoogle;
  dynamic onTapPhone;
  dynamic onTapFacebook;
  dynamic onTapSign;
  CustomAuthBtns({
    Key? key,
    this.isLogIn = true,
    this.onTapGoogle,
    this.onTapPhone,
    this.onTapFacebook,
    this.onTapSign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapSign,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: CustomText(
              text: isLogIn ? 'Log In' : 'Sign Up',
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SignBtns(
              onTap: onTapGoogle,
              icon: FontAwesomeIcons.google,
            ),
            SignBtns(
              onTap: onTapFacebook,
              icon: FontAwesomeIcons.facebook,
            ),
            SignBtns(
              onTap: onTapPhone,
              icon: FontAwesomeIcons.phone,
            ),
          ],
        ),
      ],
    );
  }
}

class SignBtns extends StatelessWidget {
  dynamic onTap;
  Color backgroundColor;
  dynamic icon;
  SignBtns({
    Key? key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.deepPurple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: FaIcon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
