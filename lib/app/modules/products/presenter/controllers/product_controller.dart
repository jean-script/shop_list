import 'package:get/get.dart';
import 'package:shop_list/app/Utils/app_logger.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_create_dto.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/domain/usecases/create_product_usecase.dart';

class ProductController extends GetxController {
  final ICreateProductUsecase _createProductUsecase;

  ProductController(this._createProductUsecase);

  final _products = <ProductDTO>[];

  Future<void> createProduct(
    String name,
    double price,
    String categoryId,
  ) async {
    final result = await _createProductUsecase(
      ProductCreateDTO(name: name, price: price, categoryId: categoryId),
    );

    result.fold(
      (fail) {
        AppLogger.log(
          '[PRODUCTS] -> erro ao criar categoria, e: ${fail.message}',
        );
      },
      (data) {
        AppLogger.log('[PRODUCTS] -> sucesso ao cria nova categorias');

        _products.add(data);
      },
    );
  }

  static ProductController get to => Get.find();
}
