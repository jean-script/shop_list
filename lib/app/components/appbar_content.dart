import 'package:flutter/material.dart';
import 'package:shop_list/app/theme/my_theme.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8.0,
            children: [
              Container(
                height: 45,
                width: 45,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Image.asset('assets/imgs/logo.png', fit: BoxFit.contain),
              ),

              Text(
                'ListaFacil',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: MyTheme.title,
                ),
              ),
            ],
          ),

          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(Icons.person, size: 25),
          ),
        ],
      ),
    );
  }
}
