import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class ThemeController extends GetxController {
  final _isDark = false.obs;

  bool get isDark => _isDark.value;

  final box = Hive.box('settings');

  ThemeMode get themeMode => _isDark.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    // _isDark.value = box.values.isNotEmpty ? box.values.first : false;
    _isDark.value = false;

    print('THEME ${box.values}');
    // Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
    Get.changeThemeMode(ThemeMode.light);
    super.onInit();
  }

  void toggleTheme() {
    _isDark.value = !_isDark.value;

    box.put('darkMode', _isDark.value);

    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  static ThemeController get to => Get.find();
}
