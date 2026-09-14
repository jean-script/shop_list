import 'package:flutter/material.dart';
import 'package:shop_list/app/theme/my_theme.dart';

class ModelFast extends StatelessWidget {
  const ModelFast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MODELOS RÁPIDOS',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),

            Text(
              'Ver todos',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: [
              _QuickListChip(
                icon: Icons.coffee_outlined,
                title: 'Café da Manhã',
              ),
              _QuickListChip(
                icon: Icons.cleaning_services_outlined,
                title: 'Limpeza Geral',
              ),
              _QuickListChip(
                icon: Icons.restaurant_outlined,
                title: 'Churrasco',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickListChip extends StatelessWidget {
  const _QuickListChip({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
      ),
      child: Row(
        spacing: 7,
        children: [
          Icon(icon, size: 17, color: theme.colorScheme.primary),
          Text(
            title,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: MyTheme.title,
            ),
          ),
        ],
      ),
    );
  }
}
