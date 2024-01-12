import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/routes/names.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/widgets/button_widget.dart';
import 'package:mobile_attandance/app/widgets/global_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
                    title: "Forgot Password",
                    subtitle: "Enter your email to reset your\npassword",
                  ),
                  SizedBox(height: 40.h),
                  Form(
                    child: Column(
                      children: [
                        BuildFormLogin(
                          label: "Email",
                          title: "Forgot Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 100),
                        ButtonCustom(
                          width: double.infinity,
                          title: "Confirm Send",
                          onPressed: () {
                            Get.toNamed(AppRoutes.VERIFY_OTP);
                          },
                        ),
                        const SizedBox(height: 15),
                        buildDivider(),
                        const SizedBox(height: 15),
                        ButtonCustom(
                          width: double.infinity,
                          title: "Cancel",
                          btnColor: redColor,
                          onPressed: () {
                            Get.back();
                          },
                        ),
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
