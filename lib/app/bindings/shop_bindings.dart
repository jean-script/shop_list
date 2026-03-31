import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/create_shop_list_repository.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/delete_shop_list_repository.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/edit_shop_list_repository.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/get_shop_list_repository.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/create_shop_list_usecase.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/delete_shop_list_usecase.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/edit_product_usecase.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/get_shop_list_usecase.dart';
import 'package:shop_list/app/modules/shop_list/external/create_shop_list_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_list/external/delete_shop_list_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_list/external/edit_shop_list_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_list/external/get_shop_list_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/create_shop_list_datasource.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/delete_shop_list_datasource.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/edit_shop_list_datasource.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/get_shop_list_datasource.dart';
import 'package:shop_list/app/modules/shop_list/infra/repositories/create_shop_list_repository_impl.dart';
import 'package:shop_list/app/modules/shop_list/infra/repositories/delete_shop_list_repository_impl.dart';
import 'package:shop_list/app/modules/shop_list/infra/repositories/edit_shop_list_repository_impl.dart';
import 'package:shop_list/app/modules/shop_list/infra/repositories/get_shop_list_repository_impl.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';

class ShopBindings extends Bindings {
  @override
  void dependencies() {
    // get list
    Get.lazyPut<IGetShopListDatasource>(() => GetShopListDatasourceImpl());
    Get.lazyPut<IGetShopListRepository>(
      () => GetShopListRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IGetShopListUsecase>(() => GetShopListUsecase(Get.find()));

    // create list
    Get.lazyPut<ICreateShopListDatasource>(
      () => CreateShopListDatasourceImpl(),
    );
    Get.lazyPut<ICreateShopListRepository>(
      () => CreateShopListRepositoryImpl(Get.find()),
    );
    Get.lazyPut<ICreateShopListUsecase>(
      () => CreateShopListUsecase(Get.find()),
    );

    // edit
    Get.lazyPut<IEditShopListDatasource>(() => EditShopListDatasourceImpl());
    Get.lazyPut<IEditShopListRepository>(
      () => EditShopListRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IEditShopListUsecase>(() => EditShopListUsecase(Get.find()));

    // delete list
    Get.lazyPut<IDeleteShopListDatasource>(
      () => DeleteShopListDatasourceImpl(),
    );
    Get.lazyPut<IDeleteShopListReposity>(
      () => DeleteShopListRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IDeleteShopListUsecase>(
      () => DeleteShopListUsecase(Get.find()),
    );

    Get.put(
      ShopListController(Get.find(), Get.find(), Get.find(), Get.find()),
      permanent: true,
    );
  }
}
