import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';
import 'package:shop_list/app/theme/theme_controller.dart';

class BottomSheetForm extends GetView<ShopListController> {
  const BottomSheetForm({super.key, this.shopList});

  final ShopListDTO? shopList;

  bool get isEdit => shopList != null;

  @override
  Widget build(BuildContext context) {
    if (isEdit) {
      controller.nameController.text = shopList!.name;
    }
    return BottomSheet(
      onClosing: () {
        controller.nameController.clear();
      },
      builder: (context) => Container(
        padding: EdgeInsets.all(15.0),
        height: 250,
        width: double.infinity,
        child: Column(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Informe o nome da lista',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O Campo nome não pode ser vazio!';
                    }
                    return null;
                  },

                  controller: controller.nameController,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ThemeController.to.isDark
                        ? Colors.white
                        : const Color(0xFF1A1A1A),
                    // fontFamily: MyTheme.fontFamily,
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
                    hintStyle: const TextStyle(
                      fontSize: 18,
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
                onTap:
                    (controller.nameController.text.isEmpty || isLoading.isTrue)
                    ? null
                    : () {
                        if (isEdit) {
                          isLoading.value = true;
                          controller
                              .edit(
                                shopList!.copyWith(
                                  name: controller.nameController.text,
                                ),
                              )
                              .whenComplete(() {
                                isLoading.value = false;
                              });
                        } else {
                          controller.create(isLoading);
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
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
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
                              'continue'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
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
    );
  }
}
