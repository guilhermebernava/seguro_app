import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomTextButton({super.key, required this.text, this.onPressed});

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
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
