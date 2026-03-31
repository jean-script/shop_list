import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/presenter/controllers/product_controller.dart';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BottomSheetProduct extends GetView<ProductController> {
  const BottomSheetProduct({super.key, this.product});

  final ProductShopDTO? product;

  bool get isEdit => product != null;

  @override
  Widget build(BuildContext context) {
    if (isEdit) controller.setInputs(product!);

    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        padding: EdgeInsets.all(15.0),
        height: 440,
        width: double.infinity,
        child: Form(
          child: Column(
            spacing: 12.0,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 12.0,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextFormField(
                    controller: controller.nameController,
                    title: 'Informe o nome do produto',
                    label: 'Nome',
                    hintText: 'Arroz Camil',
                  ),
                  MyTextFormField(
                    title: 'Informe a quantidade',
                    controller: controller.amountController,
                    label: 'Quantidade',
                    hintText: 'Ex: 2',
                  ),
                  MyTextFormField(
                    title: 'Informe o preço',
                    controller: controller.priceController,
                    label: 'Preço',
                    hintText: 'R\$ 30.00',
                    inputFormatters: [CurrencyInputFormatter()],
                    isRequired: false,
                  ),
                ],
              ),

              ObxValue(
                (isLoading) => InkWell(
                  onTap: (isLoading.isTrue)
                      ? null
                      : () async {
                          isLoading.value = true;
                          if (isEdit) {
                            controller.edit(
                              product!.copyWith(
                                amount:
                                    int.tryParse(
                                      controller.amountController.text,
                                    ) ??
                                    0,
                                name: controller.nameController.text,
                                price: ProductController.to.parseCurrency(
                                  controller.priceController.text,
                                ),
                              ),
                            );
                          } else {
                            await controller.create();
                          }
                          isLoading.value = false;
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
                                'Continue'.tr,
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
      ),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.isEmpty) {
      return const TextEditingValue(text: '');
    }

    double value = double.parse(digits) / 100;

    final newText = _formatter.format(value);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.title,
    this.inputType = TextInputType.text,
    this.isRequired = true,
    this.inputFormatters = const [],
  });

  final TextEditingController controller;
  final String label;
  final String title;
  final String hintText;
  final TextInputType inputType;
  final bool isRequired;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        TextFormField(
          // autofocus: true,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'O Campo $label não pode ser vazio!';
            }
            return null;
          },

          controller: controller,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
            // fontFamily: MyTheme.fontFamily,
          ),
          textAlign: TextAlign.center,
          maxLength: 32,
          buildCounter:
              (_, {required currentLength, required isFocused, maxLength}) {
                return null;
              },
          keyboardType: inputType,
          inputFormatters: inputFormatters,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 18,
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
              borderSide: const BorderSide(color: Colors.black12, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black26, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}
