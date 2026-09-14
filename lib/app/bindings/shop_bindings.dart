import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/create_list_repository.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/create_list_type_repository.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_list_types_repository.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_lists_repository.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/create_list_type_usecase.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/create_list_usecase.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/get_list_types_usecase.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/get_lists_usecase.dart';
import 'package:shop_list/app/modules/shop_lists/external/create_list_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_lists/external/create_list_type_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_lists/external/get_list_types_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_lists/external/get_lists_datasource_impl.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/create_list_datasource.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/create_list_type_datasource.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_list_types_datasource.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_lists_datasource.dart';
import 'package:shop_list/app/modules/shop_lists/infra/repositories/create_list_repository_impl.dart';
import 'package:shop_list/app/modules/shop_lists/infra/repositories/create_list_type_repository_impl.dart';
import 'package:shop_list/app/modules/shop_lists/infra/repositories/get_list_types_repository_impl.dart';
import 'package:shop_list/app/modules/shop_lists/infra/repositories/get_lists_repository_impl.dart';
import 'package:shop_list/app/modules/shop_lists/presenter/controllers/shop_controller.dart';

class ShopBindings extends Bindings {
  @override
  void dependencies() {
    /// criar lista
    Get.lazyPut<ICreateListDatasource>(
      () => CreateListDatasourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ICreateListRepository>(
      () => CreateListRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ICreateListUsecase>(
      () => CreateListUsecase(Get.find()),
      fenix: true,
    );

    /// criar tipo da lista
    Get.lazyPut<ICreateListTypeDatasource>(
      () => CreateListTypeDatasourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ICreateListTypeRepository>(
      () => CreateListTypeRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ICreateListTypeUsecase>(
      () => CreateListTypeUsecase(Get.find()),
      fenix: true,
    );

    /// obter tipos da lista
    Get.lazyPut<IGetListTypesDatasource>(
      () => GetListTypesDatasourceImpl(),
      fenix: true,
    );
    Get.lazyPut<IGetListTypesRepository>(
      () => GetListTypesRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<IGetListTypesUsecase>(
      () => GetListTypesUsecase(Get.find()),
      fenix: true,
    );

    /// obter listas
    Get.lazyPut<IGetListsDatasource>(
      () => GetListsDatasourceImpl(),
      fenix: true,
    );
    Get.lazyPut<IGetListsRepository>(
      () => GetListsRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<IGetListsUsecase>(
      () => GetListsUsecase(Get.find()),
      fenix: true,
    );

    Get.put(
      ShopController(Get.find(), Get.find(), Get.find(), Get.find()),
      permanent: true,
    );
  }
}
