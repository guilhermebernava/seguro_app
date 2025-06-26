import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/assets/app_images.dart';
import 'package:seguro_app/app/core/widgets/custom_text.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = size.width > 600 ? size.width * 0.05 : size.width * 0.15;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.logo, width: iconSize),
          CustomText(
            text: 'Bem Vindo !',
            padding: EdgeInsets.only(bottom: 10, top: 20),
          ),
          CustomText(
            text:
                'Aqui vocë pode gerenciar seus seguros e de seus familiares em poucos segundos',
            isParagraph: true,
          ),
        ],
      ),
    );
  }
}
