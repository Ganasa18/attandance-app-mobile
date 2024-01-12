import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    super.key,
    required this.title,
    this.onPressed,
    this.btnColor = blueColor,
    this.textColor = whiteColor,
    this.width = 250,
    this.height = 45,
  });

  String title;
  VoidCallback? onPressed;
  Color btnColor;
  Color textColor;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.h,
      height: height.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            btnColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: baseTextStyle.copyWith(
            fontWeight: bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
