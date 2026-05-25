import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/Utils/format_currency.dart';
import 'package:shop_list/app/extensions/double_extension.dart';
import 'package:shop_list/app/extensions/list_extension.dart';
import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/usecases/create_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/delete_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/edit_product_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/get_all_category_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/get_all_products_usecase.dart';
import 'package:shop_list/app/modules/product/domain/usecases/get_products_by_list_id_usecase.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';
import 'package:shop_list/app/modules/shop_list/presenter/pages/detail_list_page.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductShopDTO>> {
  final ICreateProductUsecase _createProductUsecase;
  final IEditProductUsecase _editProductUsecase;
  final IDeleteProductUsecase _deleteProductUsecase;
  final IGetProductsByListIdUsecase _getProductsByListIdUsecase;
  final IGetAllCategoryUsecase _getAllCategoryUsecase;
  final IGetAllProductsUsecase _allProductsUsecase;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController(
    text: '',
  );
  final TextEditingController priceController = TextEditingController(
    text: formatCurrency(0.0),
  );

  final RxString search = ''.obs;

  final products = <ProductShopDTO>[].obs;
  final allproducts = <ProductShopDTO>[].obs;
  final categorys = <Category>[].obs;

  final suggestions = <ProductShopDTO>[].obs;

  final selectedCategoryId = ''.obs;
  final selectedCategoryIdFilter = 'all'.obs;

  ProductController(
    this._createProductUsecase,
    this._deleteProductUsecase,
    this._editProductUsecase,
    this._getProductsByListIdUsecase,
    this._getAllCategoryUsecase,
    this._allProductsUsecase,
  );

  @override
  void onInit() {
    getAllProducts();
    getAllCategory();
    super.onInit();
  }

  Future<void> clean() async {
    products.clear();
  }

  void cleanForm() {
    nameController.clear();
    priceController.text = formatCurrency(0.0);
    amountController.clear();
  }

  void onSearchChanged(String value) {
    final query = value.toLowerCase();

    if (query.isEmpty) {
      suggestions.clear();
      return;
    }

    /// 🔥 evita duplicados por nome
    final unique = <String, ProductShopDTO>{};

    for (var p in allproducts) {
      if (p.name.toLowerCase().contains(query)) {
        unique[p.name.toLowerCase()] = p;
      }
    }

    suggestions.value = unique.values.toList();
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

  void getAllCategory() async {
    final result = await _getAllCategoryUsecase();

    result.fold(
      (fail) {
        log('getAllCategory -> falha devolvendo lista vazia');
      },
      (cgs) {
        log('getAllCategory -> sucesso');
        categorys.value = cgs;

        selectedCategoryId.value = cgs.first.id;
      },
    );
  }

  void getAllProducts() async {
    final result = await _allProductsUsecase();

    result.fold(
      (fail) {
        log('getAllProducts -> falha devolvendo lista vazia');
      },
      (prds) {
        log('getAllProducts -> sucesso');
        allproducts.value = prds;
      },
    );
  }

  String getCategoryName(String categoryId) {
    final category = categorys.firstWhereOrNull((c) => c.id == categoryId);
    return category?.name ?? 'Outros';
  }

  Future<void> create() async {
    final result = await _createProductUsecase(
      ProductShopDTO(
        id: Uuid().v4(),
        listId: ShopListController.to.selectedShopList.id,
        name: nameController.text,
        amount: int.tryParse(amountController.text) ?? 0,
        price: parseCurrency(priceController.text),
        categoryId: selectedCategoryId.value,
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

  List<dynamic> buildList() {
    final list = <dynamic>[];
    final query = search.value.toLowerCase();

    void addGrouped(List<ProductShopDTO> items, String title) {
      /// 🔥 aplica filtros primeiro
      final filtered = items.where((item) {
        final matchesSearch = item.name.toLowerCase().contains(query);

        final matchesCategory =
            selectedCategoryIdFilter.value == 'all' ||
            item.categoryId == selectedCategoryIdFilter.value;

        return matchesSearch && matchesCategory;
      }).toList();

      if (filtered.isEmpty) return;

      list.add(SectionHeader(title));

      /// 🔥 agrupar por categoria
      final Map<String, List<ProductShopDTO>> grouped = {};

      for (var item in filtered) {
        final key = item.categoryId ?? 'outros';
        grouped.putIfAbsent(key, () => []).add(item);
      }

      /// 🔥 ordenar categorias (opcional)
      final sortedKeys = grouped.keys.toList()
        ..sort((a, b) => getCategoryName(a).compareTo(getCategoryName(b)));

      for (var categoryId in sortedKeys) {
        final categoryName = getCategoryName(categoryId);

        /// 🔥 header da categoria
        list.add(CategoryHeader(categoryName));

        /// 🔥 itens
        list.addAll(grouped[categoryId]!);
      }
    }

    addGrouped(
      productNotCheck,
      'Produtos pendentes (${productNotCheck.length})',
    );

    addGrouped(
      productIsCheck,
      'Produtos no carrinho (${productIsCheck.length})',
    );

    return list;
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

  void setInputs(ProductShopDTO dto) {
    nameController.text = dto.name;
    amountController.text = dto.amount.toString();
    priceController.text = formatCurrency(dto.price);
    selectedCategoryId.value = dto.categoryId ?? 'outros';
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
