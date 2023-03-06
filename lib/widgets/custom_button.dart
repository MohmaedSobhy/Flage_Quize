import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  CustomeButton(
      {super.key, required this.color, required this.txt, required this.onTap});
  Color color;
  String txt;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 7.h,
      color: color,
      onPressed: onTap,
      child: Text(
        txt,
        style: TextStyle(color: Colors.black, fontSize: 15.sp),
      ),
    );
  }
}
