import 'package:flutter/material.dart';
import 'package:shop_list/app/Utils/format_currency.dart';
import 'package:shop_list/app/components/appbar_content.dart';
import 'package:shop_list/app/components/search_textfield.dart';
import 'package:shop_list/app/modules/shop_lists/presenter/controllers/shop_controller.dart';
import 'package:shop_list/app/modules/shop_lists/presenter/widgets/list_shoppings_card.dart';
import 'package:shop_list/app/modules/shop_lists/presenter/widgets/model_fast.dart';
import 'package:shop_list/app/theme/hexcolor.dart';
import 'package:shop_list/app/theme/my_theme.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = ShopController.to;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const SafeArea(child: AppbarContent()),
        ),
      ),

      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, size: 18),
        label: Text(
          'Nova Lista',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Minhas Listas',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: HexColor(MyTheme.primary),
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 5),

                        Text(
                          '${controller.shopLists.length} listas ativas •',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: HexColor(MyTheme.neutral)),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          '${formatCurrency(controller.calcTotalLists())} no carrinho',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.06),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.auto_awesome_outlined,
                    size: 21,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),

            SearchTextfield(textController: searchController),

            ModelFast(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Minhas Compras',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: MyTheme.title,
                      ),
                    ),

                    Text(
                      'Ordenar por recentes',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: HexColor(MyTheme.neutral),
                      ),
                    ),
                  ],
                ),

                ListShoppingsCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
