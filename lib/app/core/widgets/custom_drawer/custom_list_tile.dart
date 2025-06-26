import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String title;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 20, color: AppColors.primary),
      title: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
