import 'package:get/get.dart';
import 'package:shop_list/app/Utils/app_logger.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/create_list_type_usecase.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/create_list_usecase.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/get_list_types_usecase.dart';
import 'package:shop_list/app/modules/shop_lists/domain/usecases/get_lists_usecase.dart';

class ShopController extends GetxController with StateMixin {
  final ICreateListUsecase _createListUsecase;
  final ICreateListTypeUsecase _createListTypeUsecase;

  final IGetListTypesUsecase _getListTypesUsecase;
  final IGetListsUsecase _getListsUsecase;

  final _shopLists = <ListDTO>[].obs;
  final _typesList = <ListTypeDTO>[].obs;

  ShopController(
    this._createListUsecase,
    this._createListTypeUsecase,
    this._getListTypesUsecase,
    this._getListsUsecase,
  );

  @override
  void onInit() {
    initial();
    super.onInit();
  }

  Future<void> initial() async {
    change(null, status: RxStatus.loading());
    await getShopListTypes();
    await getShopLists();
  }

  Future<void> getShopLists() async {
    final result = await _getListsUsecase();

    result.fold(
      (fail) {
        AppLogger.log('[GET LIST] -> erro ao buscar lista: ${fail.message}');
        change(null, status: RxStatus.error());
      },
      (data) {
        AppLogger.log(
          '[GET LIST] -> sucesso ao obter listas length: ${shopLists.length}',
        );

        shopLists = data;

        if (shopLists.isEmpty) {
          change(shopLists, status: RxStatus.empty());
          return;
        }

        change(shopLists, status: RxStatus.success());
      },
    );
  }

  Future<void> getShopListTypes() async {
    final result = await _getListTypesUsecase();

    result.fold(
      (fail) {
        AppLogger.log(
          '[GET LIST] -> erro ao buscar tipos da listas: ${fail.message}',
        );
      },
      (data) {
        AppLogger.log(
          '[GET LIST] -> sucesso ao obter tipos lista length: ${shopLists.length}',
        );

        typesList = data;
      },
    );
  }

  Future<void> createShopLIstTypes(
    String title,
    String color,
    String icon,
  ) async {
    final result = await _createListTypeUsecase(
      ListTypeCreateDTO(title: title, color: color, icon: icon),
    );

    result.fold(
      (fail) {
        AppLogger.log(
          '[GET LIST] -> erro ao criar tipos da listas: ${fail.message}',
        );
      },
      (data) {
        AppLogger.log('[GET LIST] -> sucesso ao criar tipo ${data.title}');

        typesList.add(data);
      },
    );
  }

  Future<void> createShopLIst(
    String name,
    bool smartGrouping,
    String typeId,
  ) async {
    final result = await _createListUsecase(
      ListCreateDTO(name: name, smartGrouping: smartGrouping, typeId: typeId),
    );

    result.fold(
      (fail) {
        AppLogger.log('[GET LIST] -> erro ao criar lista: ${fail.message}');
      },
      (data) {
        AppLogger.log('[GET LIST] -> sucesso ao criar lista ${data.name}');

        shopLists.add(data);
      },
    );
  }

  double calcTotalLists() {
    return shopLists.fold(0, (total, list) {
      return total +
          list.items.where((item) => item.isFinished).fold(0, (subtotal, item) {
            return subtotal + (item.price * item.amount);
          });
    });
  }

  List<ListDTO> get shopLists => _shopLists.value;
  set shopLists(List<ListDTO> val) => _shopLists.value = val;

  List<ListTypeDTO> get typesList => _typesList.value;
  set typesList(List<ListTypeDTO> val) => _typesList.value = val;

  static ShopController get to => Get.find();
}
