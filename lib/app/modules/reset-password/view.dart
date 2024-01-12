import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_attandance/app/widgets/button_widget.dart';
import 'package:mobile_attandance/app/widgets/global_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
                    title: "Reset Password",
                    subtitle: "Enter your your new\npassword",
                  ),
                  SizedBox(height: 40.h),
                  Form(
                    child: Column(
                      children: [
                        BuildFormLogin(
                          label: "Password",
                          title: "Password",
                          suffixIcon: true,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        BuildFormLogin(
                          label: "Confirm Password",
                          title: "Password",
                          suffixIcon: true,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill confirm password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 100),
                        ButtonCustom(
                          width: double.infinity,
                          title: "Reset Password",
                          onPressed: () {},
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
