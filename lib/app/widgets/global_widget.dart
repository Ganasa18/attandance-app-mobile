import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/routes/names.dart';
import 'package:mobile_attandance/app/core/values/colors.dart';
import 'package:mobile_attandance/app/core/values/constans.dart';

// ignore: must_be_immutable
class BuildContainerBase extends StatelessWidget {
  BuildContainerBase(
      {super.key, this.urlImage = "assets/images/background.png"});

  String? urlImage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            urlImage!,
          ),
        ),
      ),
    );
  }
}

class BuildFormLogin extends StatefulWidget {
  const BuildFormLogin({
    super.key,
    required this.title,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.suffixIcon = false,
    this.label = '',
    required this.validator,
  });

  final String? label;
  final String title;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool suffixIcon;
  final String? Function(String?)? validator;

  @override
  State<BuildFormLogin> createState() => _BuildFormLoginState();
}

class _BuildFormLoginState extends State<BuildFormLogin> {
  bool obscureText = false; // Use local state to manage the obscureText

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText; // Initialize with the provided value
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ""
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  widget.label!,
                  style: baseTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14.sp,
                  ),
                ),
              )
            : const SizedBox(),
        TextFormField(
          obscureText: obscureText,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.title,
            suffixIcon: widget.suffixIcon
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: obscureText
                        ? const Icon(
                            Icons.visibility_off,
                          )
                        : const Icon(
                            Icons.visibility,
                          ),
                  )
                : const SizedBox(),
            hintStyle: baseTextStyle.copyWith(
              fontSize: 14.sp,
              color: greyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            fillColor: Colors.white,
          ),
          validator: widget.validator,
        )
      ],
    );
  }
}

Widget buildDivider({String text = "OR"}) {
  return Row(children: [
    const Expanded(
        child: Divider(
      thickness: 1,
    )),
    const SizedBox(width: 5),
    Text(text),
    const SizedBox(width: 5),
    const Expanded(
        child: Divider(
      thickness: 1,
    )),
  ]);
}

Column buildTitleBase({required String title, required String subtitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 20.sp,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        subtitle,
        style: baseTextStyle.copyWith(
          color: greyColor,
          fontWeight: medium,
          fontSize: 14.sp,
          letterSpacing: 0.6,
        ),
      ),
    ],
  );
}

// ignore: must_be_immutable
class BuildCustomBottomAppBar extends StatelessWidget {
  BuildCustomBottomAppBar({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            top: BorderSide(color: greyColor, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
                print("$index index selected == 0");
                Get.toNamed(AppRoutes.HOME);
                break;
              case 1:
                Get.toNamed(AppRoutes.ATTANDANCE);
                print("$index index selected == 1");
                break;
              case 2:
                print("$index index selected == 2");
                break;
              case 3:
                print("$index index selected == 3");
                break;
              default:
                print("$index error");
                break;
            }
          },
          currentIndex: index,
          elevation: 0,
          backgroundColor: Colors.transparent,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              label: 'Attandance',
              icon: Icon(
                Icons.list_alt_rounded,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              label: 'Notification',
              icon: Icon(
                Icons.notifications,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              label: 'More',
              icon: Icon(
                Icons.list,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
