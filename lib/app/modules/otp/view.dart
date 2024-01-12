import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/routes/names.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';
import 'package:mobile_attandance/app/modules/otp/widgets/widget.dart';
import 'package:mobile_attandance/app/widgets/button_widget.dart';
import 'package:mobile_attandance/app/widgets/global_widget.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BuildContainerBase(),
        Positioned(
          top: screenHeight / 8,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/logo.png',
            width: 126.h,
            height: 63.h,
          ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight / 4.5),
                  buildTitleBase(
                    title: "Verification",
                    subtitle:
                        "Authentication code has been see\non Email ****@gmail.com",
                  ),
                  SizedBox(height: 35.h),
                  Center(
                    child: Text(
                      'ENTER OTP',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildOtpInput(context: context),
                            buildOtpInput(context: context),
                            buildOtpInput(context: context),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextField(
                                onChanged: (value) {
                                  // if (value.length == 1) {
                                  //   FocusScope.of(context).nextFocus();
                                  // }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: greyDarkColor,
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Didn’t recieve OTP ?"),
                            const SizedBox(width: 4),
                            TextButton(
                              child: const Text(
                                "Resend Now",
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        buildDivider(),
                        const SizedBox(height: 15),
                        ButtonCustom(
                            title: "Verify",
                            onPressed: () {
                              Get.offAndToNamed(AppRoutes.RESET_PASSWORD);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
