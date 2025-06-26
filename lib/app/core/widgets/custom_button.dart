import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final double? size;
  final Color borderColor;
  final double borderWidth;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final VoidCallback? onPressed;
  final EdgeInsets innerPadding;

  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.size,
    this.borderColor = AppColors.gray,
    this.borderWidth = 7,
    this.shape = BoxShape.circle,
    this.borderRadius,
    this.innerPadding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: borderRadius == null
          ? const CircleBorder()
          : RoundedRectangleBorder(borderRadius: borderRadius!),
      color: Colors.transparent,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: borderRadius == null ? shape : BoxShape.rectangle,
              borderRadius: borderRadius,
              gradient: AppColors.primaryGradient,
              border: Border.all(color: borderColor, width: borderWidth),
            ),
            alignment: Alignment.center,
            child: Padding(padding: innerPadding, child: child),
          ),
        ),
      ),
    );
  }
}
