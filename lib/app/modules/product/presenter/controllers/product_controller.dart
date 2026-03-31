import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_list/app/extensions/double_extension.dart';
import 'package:shop_list/app/extensions/list_extension.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/usecases/create_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/delete_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/edit_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/get_products_by_list_id_usecase.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductShopDTO>> {
  final ICreateProductUsecase _createProductUsecase;
  final IEditProductUsecase _editProductUsecase;
  final IDeleteProductUsecase _deleteProductUsecase;
  final IGetProductsByListIdUsecase _getProductsByListIdUsecase;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController(
    text: '0',
  );
  final TextEditingController priceController = TextEditingController(
    text: '0',
  );

  final products = <ProductShopDTO>[].obs;

  ProductController(
    this._createProductUsecase,
    this._deleteProductUsecase,
    this._editProductUsecase,
    this._getProductsByListIdUsecase,
  );

  Future<void> clean() async {
    products.clear();
  }

  void cleanForm() {
    nameController.clear();
    priceController.text = formatCurrency(0);
    amountController.text = '0';
  }

  Future<void> getProducByListId(String listId) async {
    change(null, status: RxStatus.loading());
    final result = await _getProductsByListIdUsecase(listId);

    result.fold(
      (fail) {
        change(null, status: RxStatus.error());
      },
      (list) {
        products.addAll(list);
        if (products.isEmpty) {
          change(products, status: RxStatus.empty());
        } else {
          change(products, status: RxStatus.success());
        }
      },
    );
  }

  Future<List<ProductShopDTO>> getProducByListIdS(String listId) async {
    log('getProducByListIdS -> listId: $listId');
    final result = await _getProductsByListIdUsecase(listId);

    return result.fold(
      (fail) {
        log('getProducByListIdS -> falha devolvendo lista vazia');
        return [];
      },
      (list) {
        log('getProducByListIdS -> sucesso');
        return list;
      },
    );
  }

  Future<void> create() async {
    final result = await _createProductUsecase(
      ProductShopDTO(
        id: Uuid().v4(),
        listId: ShopListController.to.selectedShopList.id,
        name: nameController.text,
        amount: int.tryParse(amountController.text) ?? 0,
        price: parseCurrency(priceController.text),
      ),
    );

    result.fold((fail) {}, (sucess) {
      // Get.back();
      cleanForm();
      products.add(sucess);
      ShopListController.to.addItem(sucess);
      change(products, status: RxStatus.success());
    });
  }

  Future<void> edit(ProductShopDTO dto) async {
    final result = await _edit(dto);

    result.fold(
      (fail) {
        log('ERROR AO EDITAR ITEM');
      },
      (sucess) {
        if (Get.isBottomSheetOpen ?? false) {
          Get.back();
        }
        cleanForm();
        var index = products.indexWhere((i) => i.id == dto.id);
        products.removeAt(index);
        products.insert(index, sucess);
        change(products, status: RxStatus.success());
      },
    );
  }

  Future<Either<Exception, ProductShopDTO>> _edit(ProductShopDTO dto) async {
    return await _editProductUsecase(dto);
  }

  Future<void> delete(ProductShopDTO dto) async {
    final result = await _deleteProductUsecase(dto);

    result.fold((fail) {}, (sucess) {
      products.remove(dto);
      ShopListController.to.removeItem(dto);
      change(products, status: RxStatus.success());
    });
  }

  double parseCurrency(String text) {
    if (text.isEmpty) return 0.0;
    final clean = text.replaceAll(RegExp(r'[^\d]'), '');
    return double.parse(clean) / 100;
  }

  final _currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  String formatCurrency(double value) {
    return _currencyFormat.format(value);
  }

  void setInputs(ProductShopDTO dto) {
    nameController.text = dto.name;
    amountController.text = dto.amount.toString();
    priceController.text = formatCurrency(dto.price);
  }

  List<ProductShopDTO> get productIsCheck =>
      products.where((p) => p.isChecked).toList();
  List<ProductShopDTO> get productNotCheck =>
      products.where((p) => !p.isChecked).toList();

  String get totalCompra =>
      products.toList().sumByDouble((p) => p.amount * p.price).currency;

  String get totalCart => products
      .where((p) => p.isChecked)
      .toList()
      .sumByDouble((p) => p.amount * p.price)
      .currency;

  static ProductController get to => Get.find();
}
