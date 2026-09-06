import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_list/app/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Get.offAllNamed(AppRoutes.HOME);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final primary = colorScheme.primary;
    final secondary = colorScheme.secondary;
    final tertiary = colorScheme.tertiary;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primary.withValues(alpha: 0.08),
                    theme.scaffoldBackgroundColor,
                    tertiary.withValues(alpha: 0.08),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // ==================================================
                  // ONLINE — FICA NO TOPO
                  // ==================================================

                  Positioned(
                    top: 16,
                    right: 24,
                    child: _buildOnlineStatus(
                      primary: primary,
                      textTheme: textTheme,
                    ),
                  ),

                  // ==================================================
                  // CONTEÚDO — FICA CENTRALIZADO
                  // ==================================================
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildLogo(primary: primary),

                          const SizedBox(height: 20),

                          _buildTitle(
                            primary: primary,
                            secondary: secondary,
                            textTheme: textTheme,
                          ),

                          const SizedBox(height: 8),

                          _buildBadge(primary: primary),

                          const SizedBox(height: 14),

                          _buildDescription(textTheme: textTheme),

                          const SizedBox(height: 24),

                          _buildFeatures(
                            primary: primary,
                            secondary: secondary,
                            tertiary: tertiary,
                            textTheme: textTheme,
                          ),

                          const SizedBox(height: 34),

                          _buildProgress(
                            primary: primary,
                            textTheme: textTheme,
                          ),

                          const SizedBox(height: 20),

                          _buildVersion(primary: primary, textTheme: textTheme),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  Widget _buildOnlineStatus({
    required Color primary,
    required TextTheme textTheme,
  }) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
            ),

            const SizedBox(width: 7),

            Text(
              'ONLINE',
              style: textTheme.labelSmall?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  Widget _buildLogo({required Color primary}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 108,
          height: 108,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Image.asset('assets/imgs/logo.png', fit: BoxFit.contain),
          ),
        ),

        Positioned(
          right: -7,
          bottom: -7,
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
            child: const Icon(Icons.bolt, color: Colors.white, size: 14),
          ),
        ),
      ],
    );
  }

  // ============================================================
  Widget _buildTitle({
    required Color primary,
    required Color secondary,
    required TextTheme textTheme,
  }) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Lista',
            style: textTheme.titleMedium?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textTheme.bodyLarge?.color,
            ),
          ),
          TextSpan(
            text: 'Fácil',
            style: textTheme.titleMedium?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: primary,
            ),
          ),
          TextSpan(
            text: '●',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: secondary,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  Widget _buildBadge({required Color primary}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'COMPRAS INTELIGENTES',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: primary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // ============================================================
  Widget _buildDescription({required TextTheme textTheme}) {
    return SizedBox(
      width: 300,
      child: Text(
        'Suas compras com máxima\n'
        'economia, frescor e agilidade no\n'
        'mercado.',
        textAlign: TextAlign.center,
        style: textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.5),
      ),
    );
  }

  // ============================================================
  Widget _buildFeatures({
    required Color primary,
    required Color secondary,
    required Color tertiary,
    required TextTheme textTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FeatureCard(
          icon: Icons.bolt,
          title: 'Rápido',
          color: primary,
          textTheme: textTheme,
        ),

        const SizedBox(width: 8),

        _FeatureCard(
          icon: Icons.savings_outlined,
          title: 'Economia',
          color: secondary,
          textTheme: textTheme,
        ),

        const SizedBox(width: 8),

        _FeatureCard(
          icon: Icons.checklist_rounded,
          title: 'Organizado',
          color: tertiary,
          textTheme: textTheme,
        ),
      ],
    );
  }

  // ============================================================
  Widget _buildProgress({
    required Color primary,
    required TextTheme textTheme,
  }) {
    return Column(
      children: [
        Container(
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 1,
            child: Container(
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(width: 5),

                Text(
                  'Tudo pronto para economizar!',
                  style: textTheme.bodySmall?.copyWith(fontSize: 11),
                ),
              ],
            ),

            Text(
              '100%',
              style: textTheme.labelSmall?.copyWith(
                fontSize: 11,
                color: primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  Widget _buildVersion({required Color primary, required TextTheme textTheme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Versão 1.0.0',
          style: textTheme.bodySmall?.copyWith(fontSize: 10),
        ),

        const SizedBox(width: 10),

        Icon(Icons.verified, size: 9, color: primary),

        const SizedBox(width: 3),

        Text(
          'Oficial',
          style: textTheme.labelSmall?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ================================================================
// FEATURE CARD
// ================================================================

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final TextTheme textTheme;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 100,
      height: 72,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: color),

          const SizedBox(height: 6),

          Text(
            title,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
