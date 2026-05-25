import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';
import 'package:shop_list/app/theme/my_theme.dart';
import 'package:shop_list/app/theme/theme_controller.dart';

class BottomSheetForm extends GetView<ShopListController> {
  const BottomSheetForm({super.key, this.shopList});

  final ShopListDTO? shopList;

  bool get isEdit => shopList != null;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    if (isEdit) {
      controller.nameController.text = shopList!.name;
    }
    return SafeArea(
      child: BottomSheet(
        onClosing: () {
          controller.nameController.clear();
        },
        builder: (context) => Container(
          padding: EdgeInsets.all(15.0),
          height: 250,
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              spacing: 12.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informe o nome da lista',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: MyTheme.title),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'O Campo nome não pode ser vazio!';
                        }
                        return null;
                      },

                      controller: controller.nameController,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ThemeController.to.isDark
                            ? Colors.white
                            : const Color(0xFF1A1A1A),
                      ),
                      textAlign: TextAlign.center,
                      maxLength: 32,
                      buildCounter:
                          (
                            _, {
                            required currentLength,
                            required isFocused,
                            maxLength,
                          }) {
                            return null;
                          },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        hintText: 'Ex: Compras do mês',
                        hintStyle: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFC1C7CA),
                            ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
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
                  ],
                ),

                ObxValue(
                  (isLoading) => InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    onTap: () async {
                      if (!formKey.currentState!.validate() ||
                          isLoading.isTrue) {
                        return;
                      }
                      isLoading.value = true;

                      if (isEdit) {
                        await controller.edit(
                          shopList!.copyWith(
                            name: controller.nameController.text,
                          ),
                        );
                      } else {
                        await controller.create(isLoading);
                      }
                      // await Future.delayed(Duration(seconds: 3));
                      isLoading.value = false;
                      if (Get.isBottomSheetOpen ?? false) {
                        Get.back();
                      }
                    },
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xff0069B1),
                        border: Border.all(
                          color: const Color(0xff0069B1),
                          width: 1.0,
                        ),
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Criar'.tr,
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                    ),
                  ),
                  false.obs,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
