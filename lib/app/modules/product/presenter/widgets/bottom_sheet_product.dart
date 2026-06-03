import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/presenter/controllers/product_controller.dart';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shop_list/app/theme/my_theme.dart';

class BottomSheetProduct extends StatefulWidget {
  const BottomSheetProduct({super.key, this.product});

  final ProductShopDTO? product;

  @override
  State<BottomSheetProduct> createState() => _BottomSheetProductState();
}

class _BottomSheetProductState extends State<BottomSheetProduct> {
  bool get isEdit => widget.product != null;

  final controller = Get.find<ProductController>();
  final formKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();

  final GlobalKey checkpointInitial = GlobalKey();
  final GlobalKey checkpointButtonAdd = GlobalKey();

  @override
  void initState() {
    if (isEdit) controller.setInputs(widget.product!);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToWidget(BuildContext? currentContext) async {
    final context = currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500), // Tempo da animação
        curve: Curves.easeInOut, // Estilo da animação
        alignment: 0.5, // 0.0 = topo da tela, 0.5 = centro
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.0),
        // height: 440,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Form(
            key: formKey,
            child: Column(
              spacing: 15.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  key: checkpointInitial,
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    isEdit ? ' Editar Item' : 'Registrar Item',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: MyTheme.title,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Categoria',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(color: MyTheme.title),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categorys.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (_, index) {
                          final category = controller.categorys[index];
                          // final isSelected =
                          //     controller.selectedCategoryId.value ==
                          //     category.id;

                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller.selectedCategoryId.value =
                                    category.id;
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedCategoryId.value ==
                                          category.id
                                      ? Color(category.color)
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color:
                                        controller.selectedCategoryId.value ==
                                            category.id
                                        ? Color(category.color)
                                        : Colors.transparent,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  category.name,
                                  style: TextStyle(
                                    color:
                                        controller.selectedCategoryId.value ==
                                            category.id
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
                      inputType: TextInputType.name,
                      onChanged: controller.onSearchChanged,
                    ),
                    Obx(() {
                      if (controller.suggestions.isEmpty) return SizedBox();

                      return Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          children: controller.suggestions.map((item) {
                            return ListTile(
                              dense: true,
                              title: Text(item.name),
                              subtitle: Text(
                                '${item.amount} itens • R\$ ${item.price.toStringAsFixed(2)}',
                              ),
                              onTap: () {
                                /// 🔥 auto preencher
                                controller.nameController.text = item.name;
                                controller.amountController.text = item.amount
                                    .toString();
                                // controller.priceController.text = item.price
                                //     .toString();
                                // formatCurrency

                                controller.selectedCategoryId.value =
                                    item.categoryId ?? 'outros';

                                controller.suggestions.clear();
                              },
                            );
                          }).toList(),
                        ),
                      );
                    }),
                    MyTextFormField(
                      title: 'Informe a quantidade',
                      controller: controller.amountController,
                      label: 'Quantidade',
                      hintText: 'Ex: 2',
                      inputType: TextInputType.number,
                    ),
                    MyTextFormField(
                      title: 'Informe o preço',
                      controller: controller.priceController,
                      label: 'Preço',
                      hintText: 'R\$ 30.00',
                      inputFormatters: [CurrencyInputFormatter()],
                      isRequired: false,
                      inputType: TextInputType.number,
                      onTap: () {
                        _scrollToWidget(checkpointButtonAdd.currentContext);
                      },
                    ),
                  ],
                ),

                ObxValue(
                  (isLoading) => InkWell(
                    key: checkpointButtonAdd,
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    onTap: (isLoading.isTrue)
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            isLoading.value = true;
                            if (isEdit) {
                              controller.edit(
                                widget.product!.copyWith(
                                  amount:
                                      int.tryParse(
                                        controller.amountController.text,
                                      ) ??
                                      0,
                                  name: controller.nameController.text,
                                  price: ProductController.to.parseCurrency(
                                    controller.priceController.text,
                                  ),
                                  categoryId:
                                      controller.selectedCategoryId.value,
                                ),
                              );
                            } else {
                              await controller.create();
                            }
                            isLoading.value = false;
                            _scrollToWidget(checkpointInitial.currentContext);
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
                                  'Adicionar'.tr,
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
    this.initialValue,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;
  final String label;
  final String title;
  final String hintText;
  final String? initialValue;
  final TextInputType inputType;
  final bool isRequired;
  final List<TextInputFormatter> inputFormatters;
  final Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: MyTheme.title),
          ),
        ),
        TextFormField(
          // autofocus: true,
          validator: (value) {
            if (isRequired && (value == null || value.trim().isEmpty)) {
              return 'O Campo $label não pode ser vazio!';
            }
            return null;
          },
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
            // fontFamily: MyTheme.fontFamily,
          ),
          textAlign: TextAlign.center,
          initialValue: initialValue,
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
