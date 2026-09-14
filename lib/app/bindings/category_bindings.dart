import 'package:get/get.dart';
import 'package:shop_list/app/modules/categorys/domain/repositories/create_category_repository.dart';
import 'package:shop_list/app/modules/categorys/domain/usecases/create_category_usecase.dart';
import 'package:shop_list/app/modules/categorys/external/create_category_datasource_impl.dart';
import 'package:shop_list/app/modules/categorys/infra/datasources/create_category_datasource.dart';
import 'package:shop_list/app/modules/categorys/infra/repositories/create_category_repository_impl.dart';
import 'package:shop_list/app/modules/categorys/presenter/controllers/category_controller.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICreateCategoryDatasource>(
      () => CreateCategoryDatasourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ICreateCategoryRepository>(
      () => CreateCategoryRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ICreateCategoryUsecase>(
      () => CreateCategoryUsecase(Get.find()),
      fenix: true,
    );

    Get.put(CategoryController(Get.find()), permanent: true);
  }
}
