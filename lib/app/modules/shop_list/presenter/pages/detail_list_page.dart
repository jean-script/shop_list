import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/app/extensions/double_extension.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/presenter/controllers/product_controller.dart';
import 'package:shop_list/app/modules/product/presenter/widgets/bottom_sheet_product.dart';
import 'package:shop_list/app/modules/shop_list/presenter/controllers/shop_list_controller.dart';

class DetailListPage extends StatefulWidget {
  const DetailListPage({super.key});

  @override
  State<DetailListPage> createState() => _DetailListPageState();
}

class _DetailListPageState extends State<DetailListPage> {
  @override
  void initState() {
    ProductController.to.getProducByListId(
      ShopListController.to.selectedShopList.id,
    );
    super.initState();
  }

  @override
  void dispose() {
    ProductController.to.clean();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// 🛒 INFO
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total da compra ( ${ProductController.to.products.length} itens )',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Text(
                    ProductController.to.totalCompra,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              /// 📦 INFO CARRINHO
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text(
                  //   '${ProductController.to.productIsCheck.length} de ${ProductController.to.products.length} itens',
                  //   style: TextStyle(color: Colors.white70, fontSize: 12),
                  // ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.shopping_cart, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          ProductController.to.totalCart,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 60,
        child: ElevatedButton.icon(
          onPressed: () {
            Get.bottomSheet(BottomSheetProduct());
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
          ),
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Novo item',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () => ShopListController.to.delete(
                ShopListController.to.selectedShopList,
              ),
              icon: Icon(Icons.delete, color: Colors.redAccent),
            ),
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ShopListController.to.selectedShopList.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: ListDetail(),
        // child: Padding(padding: const EdgeInsets.all(8.0), child: ListDetail()),
      ),
    );
  }
}

class SectionHeader {
  final String title;
  SectionHeader(this.title);
}

class ListDetail extends GetView<ProductController> {
  const ListDetail({super.key});

  List<dynamic> buildList() {
    final list = <dynamic>[];

    list.add(
      SectionHeader(
        'Produtos pendentes (${ProductController.to.productNotCheck.length})',
      ),
    );
    list.addAll(controller.productNotCheck);

    if (controller.productIsCheck.isNotEmpty) {
      list.add(
        SectionHeader(
          'Produtos no carrinho (${ProductController.to.productIsCheck.length})',
        ),
      );
      list.addAll(controller.productIsCheck);
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => LinearProgressIndicator(
            value: ProductController.to.products.isEmpty
                ? 0
                : ProductController.to.productIsCheck.length /
                      ProductController.to.products.length,
            backgroundColor: Colors.white24,
            valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.obx(
              (_) {
                final items = buildList();

                return ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];

                    /// 🔥 HEADER
                    if (item is SectionHeader) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      );
                    }

                    final product = item as ProductShopDTO;

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Dismissible(
                        key: ValueKey(product.id),

                        /// 👉 remover (direita → esquerda)
                        direction: DismissDirection.horizontal,

                        background: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          color: Colors.green,
                          child: const Icon(Icons.check, color: Colors.white),
                        ),

                        secondaryBackground: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),

                        confirmDismiss: (direction) async {
                          /// 👉 marcar/desmarcar
                          if (direction == DismissDirection.startToEnd) {
                            controller.edit(
                              product.copyWith(isChecked: !product.isChecked),
                            );
                            return false;
                          }

                          /// 👉 deletar
                          if (direction == DismissDirection.endToStart) {
                            controller.delete(product);
                            return true;
                          }

                          return false;
                        },

                        child: _buildItem(product),
                      ),
                    );
                  },
                );
              },

              /// LOADING
              onLoading: const Center(child: CircularProgressIndicator()),

              /// EMPTY
              onEmpty: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart, size: 100),
                    const SizedBox(height: 8),
                    Text(
                      'Você ainda não tem itens na lista',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(ProductShopDTO product) {
    return InkWell(
      key: ValueKey(product.id),
      onTap: () {
        Get.bottomSheet(BottomSheetProduct(product: product));
      },
      borderRadius: BorderRadius.circular(10),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: product.isChecked ? 0.6 : 1,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          constraints: const BoxConstraints(minHeight: 70),
          decoration: BoxDecoration(
            color: product.isChecked
                ? Colors.grey.shade100
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// INFO
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      decoration: product.isChecked
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  Row(
                    children: [
                      if (product.total > 0.0)
                        Text(
                          '${product.total.currency} - ',
                          style: TextStyle(color: Colors.blueGrey.shade800),
                        ),
                      Text(
                        '${product.amount} ${product.amount > 1 ? 'itens' : 'item'}',
                        style: TextStyle(color: Colors.blueGrey.shade800),
                      ),
                    ],
                  ),
                ],
              ),

              /// AÇÕES
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Checkbox(
                      value: product.isChecked,
                      activeColor: Colors.blue,
                      side: BorderSide(color: Colors.grey.shade600, width: 2.0),
                      onChanged: (value) {
                        if (value == null) return;

                        controller.edit(product.copyWith(isChecked: value));
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.delete(product);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
