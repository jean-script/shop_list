import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shop_list/app/Utils/app_logger.dart';

class ThemeController extends GetxController {
  final _isDark = false.obs;
  final box = Hive.box('settings');

  @override
  void onInit() {
    var isDark = box.get('darkMode', defaultValue: false);

    AppLogger.log('ThemeController mode $isDark');

    _isDark.value = isDark;

    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
    super.onInit();
  }

  void toggleTheme() {
    _isDark.value = !_isDark.value;
    box.put('darkMode', _isDark.value);
    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  bool get isDark => _isDark.value;

  ThemeMode get themeMode => _isDark.value ? ThemeMode.dark : ThemeMode.light;

  static ThemeController get to => Get.find();
}

