import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';
import 'package:mobile_attandance/app/modules/absent/controller.dart';
import 'package:mobile_attandance/app/widgets/button_widget.dart';
import 'package:mobile_attandance/app/widgets/global_widget.dart';

class AbsentPage extends GetView<AbsentController> {
  AbsentPage({super.key});
  final AbsentController absentController = Get.find<AbsentController>();

  @override
  Widget build(BuildContext context) {
    // Ensure the camera is initialized before trying to access the controller
    Future<void> initializeController() async {
      await absentController.initializeCamera();
    }

    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BuildContainerBase(
          urlImage: "assets/images/background_2.png",
        ),
        FutureBuilder<void>(
          future: initializeController(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight / 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Text(
                                absentController.currentTime.value,
                                style: blackTextStyle.copyWith(
                                  fontSize: 40.sp,
                                  letterSpacing: 1.2,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 2),
                              child: Obx(
                                () => Text(
                                  absentController.period.value,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Monday, Sept 12, 2023",
                          style: blackTextStyle.copyWith(
                            fontWeight: regular,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 20.h,
                          ),
                          // ignore: unnecessary_null_comparison
                          child: (absentController.controller == null ||
                                  !absentController
                                      .controller.value.isInitialized)
                              ? SizedBox(
                                  width: double.infinity,
                                  height: screenHeight / 2.2,
                                  child: const AspectRatio(
                                    aspectRatio:
                                        1.0, // Set an initial aspect ratio
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  height: screenHeight / 2.2,
                                  child: AspectRatio(
                                    aspectRatio: absentController
                                        .controller.value.aspectRatio,
                                    child: CameraPreview(
                                        absentController.controller),
                                  ),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/ic-location.png",
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Location",
                                        style: blackTextStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => IconButton(
                                      onPressed: controller.isRefreshing.value
                                          ? null // Button is disabled when refreshing
                                          : () async {
                                              await controller
                                                  .refreshLocation();
                                            },
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: blueColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Obx(
                                () {
                                  if (absentController.currentLocation.value ==
                                          null ||
                                      // ignore: unnecessary_null_comparison
                                      absentController.currentAddress.value ==
                                          null) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    // Position position =
                                    //     absentController.currentLocation.value!;
                                    String? address =
                                        absentController.currentAddress.value;
                                    return Text(
                                      address != null && address.isNotEmpty
                                          ? address
                                          : 'Address not available',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    );
                                  }
                                },
                              ),
                              // Text(
                              //   "Jl. angkasa Raya no 45, RT/RW 05/10, Kemayoran, Kota",
                              // style: blackTextStyle.copyWith(
                              //   fontSize: 14.sp,
                              // ),
                              // ),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  ButtonCustom(
                                    title: "Cancel",
                                    width: 135,
                                    btnColor: lightBlueColor,
                                    textColor: blueColor,
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  ButtonCustom(
                                    title: "Clock In",
                                    width: 135,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
