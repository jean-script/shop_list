import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/components/my_scaffold.dart';
import 'package:shop_list/app/components/my_shimmer.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';
import 'package:shop_list/app/modules/shop_list/presenter/widgets/shop_list_item.dart';
import 'package:shop_list/app/theme/my_theme.dart';

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
                  color: MyTheme.title,
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
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemCount: controller.shopList.length,
                    padding: const EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      var shop = controller.shopList[index];

                      return ShopListItem(shop: shop);
                    },
                  ),
                ),
              );
            },

            onLoading: Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  spacing: 12.0,
                  children: List.generate(5, (index) => MyShimmer()),
                ),
              ),
            ),

            onEmpty: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.list_alt_sharp,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Você ainda não tem listas',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: MyTheme.title,
                    ),
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
