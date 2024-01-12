import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/routes/names.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';
import 'package:mobile_attandance/app/modules/login/controller.dart';
import 'package:mobile_attandance/app/widgets/button_widget.dart';
import 'package:mobile_attandance/app/widgets/global_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        BuildContainerBase(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 5),
                  Container(
                    width: 217.h,
                    height: 109.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildFormLogin(
                            controller: controller.textCtrl,
                            title: "Email",
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          BuildFormLogin(
                            controller: controller.textCtrl,
                            title: "Password",
                            suffixIcon: true,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.FORGOT_PASSWORD);
                            },
                            child: Text(
                              "Forgot Password ?",
                              style: baseTextStyle.copyWith(
                                color: blackColor.withOpacity(0.5),
                                fontWeight: bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          buildDivider(),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonCustom(
                                width: 230,
                                title: "LOGIN",
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    Get.offAndToNamed(AppRoutes.HOME);
                                  }
                                },
                              ),
                              Container(
                                width: 50,
                                height: 45.h,
                                decoration: const BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.fingerprint,
                                  color: whiteColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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


// class LoginPage extends GetView<HomeController>  {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//     // final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Stack(
//       children: [
//         const BuildContainerBase(child: SizedBox()),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   SizedBox(height: screenHeight / 5),
//                   Container(
//                     width: 217.h,
//                     height: 109.h,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.contain,
//                         image: AssetImage(
//                           'assets/images/logo.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 40.h),
//                   Form(
//                     // key: formKey,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           BuildFormLogin(
//                             controller: emailController,
//                             title: "Email",
//                             keyboardType: TextInputType.emailAddress,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please fill email address';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           BuildFormLogin(
//                             controller: passwordController,
//                             title: "Password",
//                             suffixIcon: true,
//                             obscureText: true,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please fill password';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 10),
//                           TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               "Forgot Password ?",
//                               style: baseTextStyle.copyWith(
//                                 color: blackColor.withOpacity(0.5),
//                                 fontWeight: bold,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 50),
//                           buildDivider(),
//                           const SizedBox(height: 20),
//                           buildButtonCustom(
//                             title: "Submit",
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {}
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
