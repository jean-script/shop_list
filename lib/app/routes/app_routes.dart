


import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_lists/presenter/pages/home_page.dart';
import 'package:shop_list/app/pages/splash_page.dart';

class AppRoutes {

  static const SPLASH = "/";
  static const HOME = "/home";
  static List<GetPage> routes() => [
    GetPage(name: SPLASH, page: ()=> SplashPage()),
    GetPage(name: HOME, page: ()=> HomePage()),
  ];
}