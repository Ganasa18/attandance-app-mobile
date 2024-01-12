import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';
import 'package:mobile_attandance/app/modules/attandance/widgets/card_attandance.dart';
import 'package:mobile_attandance/app/widgets/global_widget.dart';

class AttandancePage extends StatelessWidget {
  const AttandancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, String>> fakeDataList = [
      {
        "clockIn": "09:00am",
        "clockOut": "18:00pm",
        "workHour": "09:00",
        "onTime": "ontime",
        "dateAttendance": "17 Nov 2023",
        "lateTime": "00:00",
      },
      {
        "clockIn": "09:00am",
        "clockOut": "18:00pm",
        "workHour": "09:00",
        "onTime": "late",
        "dateAttendance": "18 Nov 2023",
        "lateTime": "00:10",
      },
      {
        "clockIn": "09:00am",
        "clockOut": "18:00pm",
        "workHour": "09:00",
        "onTime": "late",
        "dateAttendance": "19 Nov 2023",
        "lateTime": "00:05",
      },
    ];

    return Stack(
      children: [
        BuildContainerBase(
          urlImage: "assets/images/background_2.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight / 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  color: blueColor.withOpacity(
                                    0.2,
                                  ),
                                  width: 1),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: blueColor,
                              size: 20,
                            ),
                          ),
                        ),
                        Text(
                          "Attandance",
                          style: baseTextStyle.copyWith(
                            fontSize: 14.sp,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.date_range,
                            color: blueColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 540.h,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...fakeDataList
                                .map(
                                  (data) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: BuildCardExpanded(
                                      dateAttandance:
                                          data["dateAttendance"] ?? "",
                                      onTime: data["onTime"] ?? "",
                                      lateTime: data["lateTime"] ?? "",
                                      clockIn: data["clockIn"] ?? "",
                                      clockOut: data["clockOut"] ?? "",
                                      workHour: data["workHour"] ?? "",
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BuildCustomBottomAppBar(index: 1),
        ),
      ],
    );
  }
}
