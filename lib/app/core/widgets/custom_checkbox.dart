import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Color activeColor;
  final Color checkColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.activeColor = AppColors.primary,
    this.checkColor = AppColors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onChanged(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              shape: const CircleBorder(),
              activeColor: activeColor,
              checkColor: checkColor,
              side: const BorderSide(width: 1, color: AppColors.white70),
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            ),
            Flexible(child: Text(label, style: const TextStyle(fontSize: 12))),
          ],
        ),
      ),
    );
  }
}
