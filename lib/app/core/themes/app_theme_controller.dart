import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_theme.dart';

class ThemeController extends GetxController {
  final _theme = Rx<ThemeData>(AppThemes.lightTheme);

  ThemeData get theme => _theme.value;

  void changeTheme(ThemeData theme) {
    _theme.value = theme;
    Get.changeTheme(theme);
  }
}