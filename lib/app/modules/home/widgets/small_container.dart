import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class SmallContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SmallContainer({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 100,
            maxWidth: 100,
            minHeight: 100,
            maxHeight: 100,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Icon(icon, color: AppColors.primary, size: 40),
                  Spacer(),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
