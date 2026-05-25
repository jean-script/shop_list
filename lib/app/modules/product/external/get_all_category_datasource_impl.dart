import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_all_category_datasouce.dart';

class GetAllCategoryDatasourceImpl extends IGetAllCategoryDatasource {
  @override
  Future<List<Category>> call() async {
    final boxCategory = Hive.box<Category>('categories');

    return boxCategory.values.toList();
  }
}
