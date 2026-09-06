import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:shop_list/app/Utils/app_logger.dart';
import 'package:shop_list/app/routes/app_routes.dart';
import 'package:shop_list/app/theme/my_theme.dart';
import 'package:shop_list/app/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PlatformDispatcher.instance.onError = (error, stack) {
    AppLogger.error(error, stack);
    return true;
  };

  Intl.defaultLocale = 'pt_BR';
  
  await Hive.initFlutter();

  await Hive.openBox<dynamic>('settings');
  Get.put(ThemeController(), permanent: true);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode && !Platform.isAndroid,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shop List',
      debugShowCheckedModeBanner: !kReleaseMode,
      builder: DevicePreview.appBuilder,
      getPages: AppRoutes.routes(),
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeController.to.themeMode,
    );
  }
}
