import 'package:get/get.dart';
import 'package:shop_list/app/modules/product/domain/repositories/create_product_repository.dart';
import 'package:shop_list/app/modules/product/domain/repositories/delete_product_repository.dart';
import 'package:shop_list/app/modules/product/domain/repositories/edit_product_repository.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_all_category_repository.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_all_products_repository.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_products_by_list_id_repository.dart';
import 'package:shop_list/app/modules/product/domain/usecases/create_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/delete_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/edit_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/get_all_category_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/get_all_products_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/get_products_by_list_id_usecase.dart';
import 'package:shop_list/app/modules/product/external/create_product_datasource_impl.dart';
import 'package:shop_list/app/modules/product/external/delete_product_datasource_impl.dart';
import 'package:shop_list/app/modules/product/external/edit_product_datasource_impl.dart';
import 'package:shop_list/app/modules/product/external/get_all_category_datasource_impl.dart';
import 'package:shop_list/app/modules/product/external/get_all_products_datasource_impl.dart';
import 'package:shop_list/app/modules/product/external/get_products_by_list_id_datasource_impl.dart';
import 'package:shop_list/app/modules/product/infra/datasources/create_product_datasource.dart';
import 'package:shop_list/app/modules/product/infra/datasources/delete_product_datasource.dart';
import 'package:shop_list/app/modules/product/infra/datasources/edit_product_datasource.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_all_category_datasouce.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_all_products_datasource.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_products_by_list_id_datasource.dart';
import 'package:shop_list/app/modules/product/infra/repositories/create_product_repository_impl.dart';
import 'package:shop_list/app/modules/product/infra/repositories/delete_product_repository_impl.dart';
import 'package:shop_list/app/modules/product/infra/repositories/edit_product_repository_impl.dart';
import 'package:shop_list/app/modules/product/infra/repositories/get_all_category_repository_impl.dart';
import 'package:shop_list/app/modules/product/infra/repositories/get_all_products_repository_impl.dart';
import 'package:shop_list/app/modules/product/infra/repositories/get_products_by_list_id_repository_impl.dart';
import 'package:shop_list/app/modules/product/presenter/controllers/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    // get list
    Get.lazyPut<IGetProductsByListIdDatasource>(
      () => GetProductsByListIdDatasourceImpl(),
    );
    Get.lazyPut<IGetProductsByListIdRepository>(
      () => GetProductsByListIdRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IGetProductsByListIdUsecase>(
      () => GetProductsByListIdUsecase(Get.find()),
    );

    // create
    Get.lazyPut<ICreateProductDatasource>(() => CreateProductDatasourceImpl());
    Get.lazyPut<ICreateProductRepository>(
      () => CreateProductRepositoryImpl(Get.find()),
    );
    Get.lazyPut<ICreateProductUsecase>(() => CreateProductUsecase(Get.find()));

    // edit
    Get.lazyPut<IEditProductDatasource>(() => EditProductDatasourceImpl());
    Get.lazyPut<IEditProductRepository>(
      () => EditProductRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IEditProductUsecase>(() => EditProductUsecase(Get.find()));

    // delete
    Get.lazyPut<IDeleteProductDatasource>(() => DeleteProductDatasourceImpl());
    Get.lazyPut<IDeleteProductRepository>(
      () => DeleteProductRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IDeleteProductUsecase>(() => DeleteProductUsecase(Get.find()));

    // get all products
    Get.lazyPut<IGetAllProductsDatasource>(
      () => GetAllProductsDatasourceImpl(),
    );
    Get.lazyPut<IGetAllProductsRepository>(
      () => GetAllProductsRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IGetAllProductsUsecase>(
      () => GetAllProductsUsecase(Get.find()),
    );
    // get all categorys
    Get.lazyPut<IGetAllCategoryDatasource>(
      () => GetAllCategoryDatasourceImpl(),
    );
    Get.lazyPut<IGetAllCategoryRepository>(
      () => GetAllCategoryRepositoryImpl(Get.find()),
    );
    Get.lazyPut<IGetAllCategoryUsecase>(
      () => GetAllCategoryUsecase(Get.find()),
    );

    Get.put(
      ProductController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
      permanent: true,
    );
  }
}
