import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';

Row buildHeaderHome() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 126.w,
        height: 63.h,
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      Container(
        width: 58,
        height: 58,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/profile.png"),
          ),
        ),
      ),
    ],
  );
}

Padding buildIconTime() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 2.w),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/icons/ic-time-in.png'),
            Image.asset('assets/icons/ic-time-out.png'),
            Image.asset('assets/icons/ic-hour-time.png'),
          ],
        ),
      ],
    ),
  );
}

Column buildTimeHour({required String time, required String label}) {
  return Column(
    children: [
      Text(
        textAlign: TextAlign.center,
        time,
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 14.sp,
          letterSpacing: 1.2,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        textAlign: TextAlign.center,
        label,
        style: greyTextStyle,
      ),
    ],
  );
}
