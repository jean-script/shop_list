import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';
import 'package:shop_list/app/modules/shop_list/presenter/widgets/bottom_sheet_form.dart';
import 'package:shop_list/app/routes/routes.dart';

class ShopListItem extends StatelessWidget {
  const ShopListItem({super.key, required this.shop});

  final ShopListDTO shop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        ShopListController.to.selectedShopList = shop;
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
                Icon(Icons.list_alt_outlined, color: theme.iconTheme.color),
                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shop.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
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
                Get.bottomSheet(BottomSheetForm(shopList: shop)).whenComplete(
                  () {
                    ShopListController.to.nameController.clear();
                  },
                );
              },
              icon: Icon(Icons.edit_rounded, color: theme.disabledColor),
            ),
          ],
        ),
      ),
    );
  }
}
