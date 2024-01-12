import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';

// ignore: must_be_immutable
class CustomAttandanceButton extends StatefulWidget {
  CustomAttandanceButton({super.key, required this.type, this.onTap});

  String type;
  VoidCallback? onTap;

  @override
  State<CustomAttandanceButton> createState() => _CustomAttandanceButtonState();
}

class _CustomAttandanceButtonState extends State<CustomAttandanceButton>
    with SingleTickerProviderStateMixin {
  late double scale;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  void _tapDown(TapDownDetails details) {
    controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> listColor = widget.type == "clock-in"
        ? [blueColor, greenColor]
        : [redColor, blueColor];

    String typeIcon =
        widget.type == "clock-in" ? "ic-clock-in.png" : "ic-clock-out.png";

    scale = 1 - controller.value;
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: scale,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 175.w,
              height: 175.w,
              decoration: const BoxDecoration(
                color: lightBlueColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            widget.type == "clock-finish"
                ? Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/ic-clock-finish.png',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Time Marked",
                          style: baseTextStyle.copyWith(
                            color: greenColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: listColor,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/$typeIcon',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.type == 'clock-in' ? 'Clock In' : 'Clock Out',
                          style: baseTextStyle.copyWith(
                            color: whiteColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
