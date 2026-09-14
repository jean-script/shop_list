import 'package:get/get.dart';
import 'package:shop_list/app/bindings/shop_bindings.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    ShopBindings().dependencies();
  }
}
