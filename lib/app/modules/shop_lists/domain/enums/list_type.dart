import 'package:flutter/material.dart';
import 'package:shop_list/app/theme/my_theme.dart';

enum ListType {
  shopping("Lista de compras", MyTheme.primary, Icons.shopping_cart);

  const ListType(this.title, this.color, this.icon);

  final String title;
  final String color;
  final IconData icon;
}
