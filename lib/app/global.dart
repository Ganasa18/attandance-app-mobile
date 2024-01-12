import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Global {
  static Future init() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ));
  }
}
