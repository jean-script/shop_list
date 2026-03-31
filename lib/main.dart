import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop_list/app/modules/history/domain/entities/purchase_history_entity.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/routes/routes.dart';
import 'package:shop_list/app/theme/my_theme.dart';
import 'package:shop_list/app/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductShopDTOAdapter());
  await Hive.openBox<ProductShopDTO>('ProductList');

  Hive.registerAdapter(ShopListDTOAdapter());
  await Hive.openBox<ShopListDTO>('ShopList');

  Hive.registerAdapter(PurchaseHistoryAdapter());
  await Hive.openBox<PurchaseHistory>('history');

  await Hive.openBox<dynamic>('settings');
  Get.put(ThemeController(), permanent: true);

  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
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
