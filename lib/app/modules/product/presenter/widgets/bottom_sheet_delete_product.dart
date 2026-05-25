import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/presenter/controllers/product_controller.dart';

class BottomSheetDeleteProduct extends GetView<ProductController> {
  const BottomSheetDeleteProduct({super.key, required this.product});

  final ProductShopDTO product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
          padding: EdgeInsets.all(15.0),
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Deseja remover o produto:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Row(
                  spacing: 12.0,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 64,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cancelar'.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ObxValue((isLoading) {
                        return InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          onTap: isLoading.isTrue
                              ? null
                              : () async {
                                  isLoading.value = true;
                                  controller.delete(product);
                                  isLoading.value = false;
                                  Get.back();
                                },
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(color: Colors.red, width: 1.0),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                            ),
                            child: isLoading.isTrue
                                ? ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: 24,
                                      maxWidth: 24,
                                    ),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Confimar'.tr,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        );
                      }, false.obs),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
