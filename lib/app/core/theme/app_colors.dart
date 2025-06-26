import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3BB58B);
  static const Color secundary = Color(0xffE8DD84);
  static const Color gray = Color(0xff2B2A3A);
  static const Color backgroundCard = Color(0xFF21212B);
  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;
  static const Color red = Colors.red;

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.primary, AppColors.secundary],
  );
}
