import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class CustomToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function()? onPressed;

  const CustomToggleButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.white70,
          decoration: isSelected ? TextDecoration.underline : null,
          decorationColor: AppColors.primary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
