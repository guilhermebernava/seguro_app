import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;

  const SocialButton({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(image, fit: BoxFit.fill, width: 35),
      ),
    );
  }
}
