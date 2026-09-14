import 'package:get/get.dart';
import 'package:shop_list/app/modules/products/domain/repositories/create_product_repository.dart';
import 'package:shop_list/app/modules/products/domain/usecases/create_product_usecase.dart';
import 'package:shop_list/app/modules/products/external/create_product_datasource_impl.dart';
import 'package:shop_list/app/modules/products/infra/datasources/create_product_datasource.dart';
import 'package:shop_list/app/modules/products/infra/repositories/create_product_repository_impl.dart';
import 'package:shop_list/app/modules/products/presenter/controllers/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICreateProductDatasource>(
      () => CreateProductDatasourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ICreateProductRepository>(
      () => CreateProductRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ICreateProductUsecase>(
      () => CreateProductUsecase(Get.find()),
      fenix: true,
    );

    Get.put(ProductController(Get.find()), permanent: true);
  }
}
