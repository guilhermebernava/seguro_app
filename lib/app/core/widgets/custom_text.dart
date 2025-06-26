import 'package:flutter/widgets.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool isParagraph;
  final EdgeInsets padding;

  const CustomText({
    super.key,
    required this.text,
    this.isParagraph = false,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontSize: !isParagraph ? 24 : 14,
          color: AppColors.white70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
