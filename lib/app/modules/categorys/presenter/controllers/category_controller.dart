import 'package:get/get.dart';
import 'package:shop_list/app/Utils/app_logger.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_create_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/usecases/create_category_usecase.dart';

class CategoryController extends GetxController {
  final ICreateCategoryUsecase _createCategoryUsecase;

  CategoryController(this._createCategoryUsecase);

  final _categories = <CategoryDTO>[].obs;

  Future<void> createCategory(String name, String color, String icon) async {
    final result = await _createCategoryUsecase(
      CategoryCreateDTO(name: name, color: color, icon: icon),
    );

    result.fold(
      (fail) {
        AppLogger.log(
          '[CATEGORY] -> erro ao criar categoria, e: ${fail.message}',
        );
      },
      (data) {
        AppLogger.log('[CATEGORY] -> sucesso ao cria nova categorias');

        _categories.add(data);
      },
    );
  }

  static CategoryController get to => Get.find();
}
