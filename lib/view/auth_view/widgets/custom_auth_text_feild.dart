import 'package:authentication_app/controller/sign_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomAuthTextFiled extends StatefulWidget {
  bool isEmail;
  bool isVisible;
  bool isConfirmPassword;
  dynamic controller;
  CustomAuthTextFiled({
    Key? key,
    this.controller,
    this.isEmail = true,
    this.isVisible = true,
    this.isConfirmPassword = false,
  }) : super(key: key);

  @override
  State<CustomAuthTextFiled> createState() => _CustomAuthTextFiledState();
}

class _CustomAuthTextFiledState extends State<CustomAuthTextFiled> {
  @override
  Widget build(BuildContext context) {
    SignController authController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: TextFormField(
            style: TextStyle(color: Colors.deepOrange.shade900),
            controller: widget.controller,
            validator: (v) {
              if (widget.isEmail) {
                if (v!.isEmpty) {
                  return 'email must note be empty';
                } else if (!v.toString().contains('@') ||
                    !v.toString().contains('gmail.com')) {
                  return 'ex: example@gmail.com';
                }
              }

              if (!widget.isConfirmPassword && !widget.isEmail) {
                RegExp regExp = RegExp(r"(?=.*[a-z])(?=.[A-Z])\w+");
                if (v!.isEmpty) {
                  return 'password must note be empty';
                } else if (v.length < 8) {
                  return 'password must  be more than 8 characters';
                } else if (!v.toString().contains(regExp)) {
                  return 'Use Numbers and Capital and Small characters at least 1';
                }
              }

              if (widget.isConfirmPassword && !widget.isEmail) {
                RegExp regExp = RegExp(r"(?=.*[a-z])(?=.[A-Z])\w+");
                if (v!.isEmpty) {
                  return 'confirm password must note be empty';
                } else if (v !=
                    authController.signUPpasswordTextController.text) {
                  return 'password must  be same';
                } else if (v.length < 8) {
                  return 'password must  be more than 8 characters';
                } else if (!v.toString().contains(regExp)) {
                  return 'Use Numbers and Capital and Small characters at least 1';
                }
              }
              return null;
            },
            obscureText: widget.isEmail
                ? false
                : widget.isVisible
                    ? true
                    : false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorMaxLines: 1,
              isDense: true,
              contentPadding: const EdgeInsets.only(
                left: 14,
                right: 8,
                top: 8,
                bottom: 8,
              ),
              prefixIcon: widget.isEmail
                  ? const Icon(Icons.email_outlined, color: Colors.deepPurple)
                  : widget.isVisible
                      ? const Icon(Icons.lock, color: Colors.deepPurple)
                      : const Icon(Icons.lock, color: Colors.deepPurple),
              suffixIcon: widget.isEmail
                  ? null
                  : !widget.isVisible
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.isVisible = !widget.isVisible;
                            });
                          },
                          child: const Icon(Icons.visibility_rounded,
                              color: Colors.deepPurple),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.isVisible = !widget.isVisible;
                            });
                          },
                          child: const Icon(Icons.visibility_off,
                              color: Colors.deepPurple),
                        ),
              hintText: widget.isEmail
                  ? 'example@gmail.com'
                  : widget.isConfirmPassword
                      ? 'confirm password'
                      : 'password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.deepPurple, width: 2)),
            ),
          ),
        ),
      ],
    );
  }
}
