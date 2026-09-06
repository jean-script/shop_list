import 'package:flutter/material.dart';
import 'package:shop_list/app/components/appbar_content.dart';
import 'package:shop_list/app/components/search_textfield.dart';
import 'package:shop_list/app/modules/shop_lists/presenter/widgets/list_shoppings_card.dart';
import 'package:shop_list/app/theme/hexcolor.dart';
import 'package:shop_list/app/theme/my_theme.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                spreadRadius: 0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SafeArea(child: AppbarContent()),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
        child: Column(
          spacing: 12.0,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Minhas Listas',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      spacing: 4.0,
                      children: [
                        Text(
                          '3 listas ativas • ',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: HexColor(MyTheme.neutral)),
                        ),
                        Text(
                          'R\$ 342,80 no carrinho',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Theme.of(context).colorScheme.primary.withAlpha(9),
                  ),
                  child: Icon(Icons.auto_awesome_outlined, size: 25),
                ),
              ],
            ),

            SearchTextfield(textController: searchController),

            ListShoppingsCard(),
          ],
        ),
      ),
    );
  }
}
