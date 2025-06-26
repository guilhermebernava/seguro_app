import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class HalfGradientBackground extends StatelessWidget {
  final Widget child;

  const HalfGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fundo dividido verticalmente
        Column(
          children: [
            // Metade com gradiente
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
              ),
            ),
            // Metade com cor sólida
            Expanded(child: Container(color: AppColors.backgroundCard)),
          ],
        ),

        // Conteúdo acima do fundo
        Positioned.fill(child: child),
      ],
    );
  }
}
