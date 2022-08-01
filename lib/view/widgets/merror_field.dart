import 'dart:ui';
import 'package:flutter/material.dart';

class MerrorField extends StatelessWidget {
  dynamic child;
  double height;
  MerrorField({
    Key? key,
    required this.child,
    this.height = 320,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurpleAccent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey.withOpacity(0.6),
                    Colors.white.withOpacity(0.5),
                  ],
                ),
              ),
            ),
            Container(padding: const EdgeInsets.all(20), child: child)
          ],
        ),
      ),
    );
  }
}
