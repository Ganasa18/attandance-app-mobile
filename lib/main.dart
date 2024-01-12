import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_attandance/app/core/routes/names.dart';
import 'package:mobile_attandance/app/core/routes/pages.dart';
import 'package:mobile_attandance/app/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: 'Attandance Apps',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.INITIAL,
        getPages: AppPages.pages,
        builder: EasyLoading.init(),
      ),
    );
  }
}
