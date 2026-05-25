import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:shop_list/app/modules/product/presenter/controllers/product_controller.dart';
import 'package:shop_list/app/theme/my_theme.dart';
import 'package:shop_list/app/theme/theme_controller.dart';

class SearchFieldWidget extends GetView<ProductController> {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        autofocus: false,

        // validator: (value) {
        //   if (value == null || value.trim().isEmpty) {
        //     return 'O Campo nome não pode ser vazio!';
        //   }
        //   return null;
        // },
        // controller: controller.searchController,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: MyTheme.title),
        textAlign: TextAlign.start,
        maxLength: 32,
        onChanged: (value) => controller.search.value = value,
        buildCounter:
            (_, {required currentLength, required isFocused, maxLength}) {
              return null;
            },
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
          prefixIcon: Icon(Icons.search_rounded, color: Colors.black26),
          hintText: 'Buscar produtos',
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: Color(0xFFC1C7CA),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: ThemeController.to.isDark
                  ? Colors.white60
                  : Colors.black12,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: ThemeController.to.isDark
                  ? Colors.white60
                  : Colors.black26,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
