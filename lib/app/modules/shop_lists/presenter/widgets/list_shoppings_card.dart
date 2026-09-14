import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_lists/presenter/controllers/shop_controller.dart';
import 'package:shop_list/app/theme/my_theme.dart';

class ListShoppingsCard extends GetView<ShopController> {
  const ListShoppingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Minhas Compras',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: MyTheme.title,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Ordenar por recentes',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MyTheme.subtitle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
