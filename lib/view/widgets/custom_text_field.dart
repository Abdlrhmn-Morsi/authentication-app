// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
String hint;
Function(String) function;
   CustomTextField({
    Key? key,
    required this.hint,
    required this.function,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.greenAccent,
      keyboardType:TextInputType.emailAddress ,
      maxLines: 1,
      onChanged: function,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
           borderSide: const BorderSide(color: Colors.white,width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.deepPurpleAccent,width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
