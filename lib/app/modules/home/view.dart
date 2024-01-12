import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/routes/names.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';
import 'package:mobile_attandance/app/modules/home/widgets/custom_attandance_button.dart';
import 'package:mobile_attandance/app/modules/home/widgets/home_widget.dart';
import 'package:mobile_attandance/app/widgets/global_widget.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String currentTime;
  late String period;
  late Timer _timer;
  late String currentClock;

  @override
  void initState() {
    super.initState();
    var timeData = formatTime(DateTime.now());
    currentTime = timeData[0];
    period = timeData[1];
    currentClock = 'clock-in';

    // Update the time every second
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        var timeData = formatTime(DateTime.now());
        currentTime = timeData[0];
        period = timeData[1];
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  List<String> formatTime(DateTime dateTime) {
    String formattedTime = DateFormat('hh:mm').format(dateTime);
    String period = DateFormat('a').format(dateTime).toLowerCase();
    return [formattedTime, period];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String currentDate = DateFormat('EEEE, MMM d, y').format(now);
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
                  children: [
                    SizedBox(height: screenHeight / 12),
                    buildHeaderHome(),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentTime,
                          style: blackTextStyle.copyWith(
                            fontSize: 40.sp,
                            letterSpacing: 1.2,
                            fontWeight: semiBold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 2),
                          child: Text(
                            period,
                            style: blackTextStyle.copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      currentDate,
                      style: blackTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomAttandanceButton(
                      type: currentClock,
                      onTap: () {
                        if (currentClock != 'clock-finish') {
                          Get.toNamed(AppRoutes.ABSENT);
                        }
                      },
                    ),
                    // CustomAttandanceButton(type: 'clock-finish'),
                    SizedBox(height: 50.h),
                    buildIconTime(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTimeHour(time: "09:00", label: "Clock In"),
                        buildTimeHour(time: "00:00", label: "Clock Out"),
                        buildTimeHour(time: "00:00", label: "Total Hr"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BuildCustomBottomAppBar(index: 0),
        ),
      ],
    );
  }
}
