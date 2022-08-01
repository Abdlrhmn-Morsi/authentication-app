// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  dynamic fontWeight;
  CustomText({
    Key? key,
    this.fontWeight,
    this.fontSize = 25,
    this.color = Colors.white,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      
      style: TextStyle(
        height:1.5 ,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
