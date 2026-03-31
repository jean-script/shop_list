import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/create_shop_list_usecase.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/delete_shop_list_usecase.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/edit_product_usecase.dart';
import 'package:shop_list/app/modules/shop_list/domain/usecases/get_shop_list_usecase.dart';
import 'package:uuid/uuid.dart';

class ShopListController extends GetxController
    with StateMixin<List<ShopListDTO>> {
  final IGetShopListUsecase _getShopListUsecase;
  final ICreateShopListUsecase _createShopListUsecase;
  final IEditShopListUsecase _editShopListUsecase;
  final IDeleteShopListUsecase _deleteShopListUsecase;

  final TextEditingController nameController = TextEditingController();

  final _shopList = <ShopListDTO>[].obs;

  ShopListDTO selectedShopList = ShopListDTO(
    id: '',
    name: '',
    createdAt: DateTime.now(),
    itens: [],
  );

  ShopListController(
    this._getShopListUsecase,
    this._createShopListUsecase,
    this._editShopListUsecase,
    this._deleteShopListUsecase,
  );

  @override
  void onReady() {
    getShopList();
    super.onReady();
  }

  void getShopList() async {
    log('getShopList -> iniciando');
    change(null, status: RxStatus.loading());
    final result = await _getShopListUsecase();

    result.fold(
      (fail) {
        log('getShopList -> sem lista');
        change(null, status: RxStatus.empty());
      },
      (newShopList) async {
        shopList = newShopList;
        await Future.delayed(Duration(seconds: 1));

        log('getShopList -> sucesso');

        if (shopList.isEmpty) {
          change(shopList, status: RxStatus.empty());
        } else {
          change(newShopList, status: RxStatus.success());
        }
      },
    );
  }

  Future<void> create(RxBool isLoading) async {
    isLoading.value = true;
    final result = await _createShopListUsecase(
      ShopListDTO(
        id: Uuid().v4(),
        name: nameController.text,
        createdAt: DateTime.now(),
        itens: [],
      ),
    );

    result.fold(
      (fail) {
        log('DEU ERRO NA CRIAÇÂO');
      },
      (shop) {
        Get.back();
        nameController.clear();
        shopList.add(shop);
        change(shopList, status: RxStatus.success());
      },
    );
    isLoading.value = false;
  }

  Future<void> edit(ShopListDTO dto) async {
    final result = await _edit(dto);

    result.fold(
      (fail) {
        log('ERROR AO EDITAR ITEM');
      },
      (sucess) {
        if (Get.isBottomSheetOpen ?? false) {
          Get.back();
        }

        log('Editado com sucesso!');

        var index = shopList.indexWhere((i) => i.id == dto.id);
        shopList.removeAt(index);
        shopList.insert(index, sucess);
        nameController.clear();
        change(shopList, status: RxStatus.success());
      },
    );
  }

  Future<Either<Exception, ShopListDTO>> _edit(ShopListDTO dto) async {
    return await _editShopListUsecase(dto);
  }

  void delete(ShopListDTO dto) async {
    final result = await Get.showOverlay(
      asyncFunction: () => _deleteShopListUsecase(dto),
      loadingWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      ),
    );

    result.fold((fail) {}, (_) {
      Get.back();
      shopList.remove(dto);
      if (shopList.isEmpty) {
        change(shopList, status: RxStatus.empty());
      } else {
        change(shopList, status: RxStatus.success());
      }
      log('lista deletada com sucesso');
    });
  }

  void addItem(ProductShopDTO item) {
    shopList
        .firstWhere((shop) => shop.id == selectedShopList.id)
        .itens
        .add(item);

    change(shopList, status: RxStatus.success());
  }

  void removeItem(ProductShopDTO item) {
    shopList
        .firstWhere((shop) => shop.id == selectedShopList.id)
        .itens
        .remove(item);
    change(shopList, status: RxStatus.success());
  }

  List<ShopListDTO> get shopList => _shopList.value;
  set shopList(List<ShopListDTO> val) => _shopList.value = val;

  static ShopListController get to => Get.find();
}
