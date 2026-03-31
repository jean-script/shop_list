import 'package:get/get.dart';
import 'package:shop_list/app/bindings/product_bindings.dart';
import 'package:shop_list/app/bindings/shop_bindings.dart';
import 'package:shop_list/app/modules/shop_list/presenter/pages/detail_list_page.dart';
import 'package:shop_list/app/modules/shop_list/presenter/pages/home_page.dart';

class Routes {
  static const HOME = '/';
  static const DETAIL = '/shop/list/detail';

  static List<GetPage> get() => [
    GetPage(
      name: HOME,
      page: () => HomePage(),
      bindings: [ShopBindings(), ProductBindings()],
    ),
    GetPage(name: DETAIL, page: () => DetailListPage()),
  ];
}
