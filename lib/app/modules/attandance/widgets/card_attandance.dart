import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';

class BuildCardExpanded extends StatefulWidget {
  BuildCardExpanded({
    super.key,
    required this.dateAttandance,
    required this.onTime,
    required this.lateTime,
    required this.clockIn,
    required this.clockOut,
    required this.workHour,
  });

  String dateAttandance;
  String onTime;
  String lateTime;
  String clockIn;
  String clockOut;
  String workHour;

  @override
  State<BuildCardExpanded> createState() => _BuildCardExpandedState();
}

class _BuildCardExpandedState extends State<BuildCardExpanded> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
          const Duration(milliseconds: 300), // Adjust the duration as needed
      curve: Curves.easeInOut,
      width: double.infinity,
      height: isExpanded ? 240.h : 150.h, // Adjust heights as needed
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: blackColor.withOpacity(0.8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 8.0,
                    child: Container(
                      width: 2,
                      height: 35.0, // Assuming 35.h is a custom size unit
                      color: blueColor,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            widget.dateAttandance,
                            style: blackTextStyle.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // make visible height to 240.h or hide 180.h
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: const Icon(
                            Icons.list_alt,
                            color: greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              // LABEL TIME ATTENDANCE
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          "Clock In",
                          textAlign: TextAlign.start,
                          style: blackTextStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          "Clock Out",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          "Work Hr",
                          textAlign: TextAlign.right,
                          style: blackTextStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // VALUE TIME ATTENDANCE
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          widget.clockIn,
                          textAlign: TextAlign.start,
                          style: baseTextStyle.copyWith(
                            color: greenColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          widget.clockOut,
                          textAlign: TextAlign.center,
                          style: baseTextStyle.copyWith(
                            color: redColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          widget.workHour,
                          textAlign: TextAlign.right,
                          style: baseTextStyle.copyWith(
                            color: blueColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              AnimatedOpacity(
                opacity: isExpanded ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Visibility(
                  visible: isExpanded,
                  child: Column(
                    children: [
                      // make colapse/hide or visible on tap
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Status :",
                            style: baseTextStyle.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.onTime,
                            style: baseTextStyle.copyWith(
                              color: widget.onTime == 'ontime'
                                  ? greenColor
                                  : redColor,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Late :",
                            style: baseTextStyle.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.lateTime,
                            style: baseTextStyle.copyWith(
                              color: redColor,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
