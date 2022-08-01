import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  dynamic function;
  Color color;
  dynamic child;
  bool isSign;

  CustomButton({
    Key? key,
    this.isSign = false,
    this.color = Colors.black,
    this.child,
    required this.title,
    required this.function,
  }) : super(key: key);

  List iconsList = [
    'assets/images/Sample_User_Icon-removebg-preview.png',
    'assets/images/google1-removebg-preview.png',
    'assets/images/Facebook_f_logo__2019_.svg-removebg-preview.png',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: color,
      onPressed: function,
      child: Row(
        mainAxisAlignment:isSign? MainAxisAlignment.center:MainAxisAlignment.start,
        children: [
          isSign
              ? Container(
                  height: 30,
                )
              : Container(
                  height: 30,
                  width: 30,
                  child: child,
                ),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
