import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/components/my_scaffold.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';
import 'package:shop_list/app/modules/shop_list/presenter/widgets/bottom_sheet_form.dart';
import 'package:shop_list/app/routes/routes.dart';

class HomePage extends GetView<ShopListController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MyScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Suas listas',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          controller.obx(
            (state) {
              return Obx(
                () => Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemCount: controller.shopList.length,
                    padding: const EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      var shop = controller.shopList[index];

                      return InkWell(
                        onTap: () {
                          controller.selectedShopList = shop;
                          Get.toNamed(Routes.DETAIL);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          constraints: const BoxConstraints(minHeight: 70),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.list_alt_outlined,
                                    color: theme.iconTheme.color,
                                  ),
                                  const SizedBox(width: 12),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shop.name,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      Text(
                                        '${shop.totalItens} itens',
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                    BottomSheetForm(shopList: shop),
                                  ).whenComplete(() {
                                    controller.nameController.clear();
                                  });
                                },
                                icon: Icon(
                                  Icons.edit_rounded,
                                  color: theme.disabledColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },

            onLoading: const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),

            onEmpty: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list_alt_sharp, size: 100),
                  const SizedBox(height: 8),
                  Text(
                    'Você ainda não tem listas',
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
