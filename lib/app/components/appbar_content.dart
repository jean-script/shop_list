import 'package:flutter/material.dart';
import 'package:shop_list/app/theme/my_theme.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                height: 42,
                width: 42,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset('assets/imgs/logo.png', fit: BoxFit.contain),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ListaFácil',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: MyTheme.title,
                    ),
                  ),
                  Text(
                    'Olá, Ana',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 11,
                      color: MyTheme.subtitle,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.withValues(alpha: 0.15)),
            ),
            child: const Icon(Icons.person_outline, size: 21),
          ),
        ],
      ),
    );
  }
}
