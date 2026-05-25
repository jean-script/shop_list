import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:shop_list/app/Utils/app_logger.dart';
import 'package:shop_list/app/modules/history/domain/entities/purchase_history_entity.dart';
import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart'
    as cat;
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/routes/routes.dart';
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

  Hive.registerAdapter(cat.CategoryAdapter());
  await Hive.openBox<cat.Category>('categories');
  cat.buildCategoryDefaults();

  Hive.registerAdapter(ProductShopDTOAdapter());
  await Hive.openBox<ProductShopDTO>('ProductList');

  final settings = Hive.box('settings');

  if (settings.get('migrated_v2') != true) {
    await migrateProducts();
    await settings.put('migrated_v2', true);
  }

  Hive.registerAdapter(ShopListDTOAdapter());
  await Hive.openBox<ShopListDTO>('ShopList');

  Hive.registerAdapter(PurchaseHistoryAdapter());
  await Hive.openBox<PurchaseHistory>('history');

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
      getPages: Routes.get(),
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeController.to.themeMode,
    );
  }
}
