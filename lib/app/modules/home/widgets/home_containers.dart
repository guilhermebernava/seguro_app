import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/modules/home/controllers/home_controller.dart';
import 'package:seguro_app/app/modules/home/widgets/big_container.dart';
import 'package:seguro_app/app/modules/home/widgets/cotar_contratar_widget.dart';

class HomeContainers extends StatelessWidget {
  final HomeController controller;

  const HomeContainers({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.backgroundCard,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              CotarContratarWidget(controller: controller),
              BigContainer(
                title: 'Minha Familia',
                iconData: Icons.add_circle_outline,
                text:
                    'Adicione aqui membros da sua familia e compartilhe os seguros com eles.',
              ),
              BigContainer(
                title: 'Contratados',
                iconData: Icons.sentiment_dissatisfied_outlined,
                text: 'Você ainda não possui seguros contratados.',
              ),
              BigContainer(
                title: 'Carros',
                iconData: Icons.safety_check,
                text: 'Você ainda não possui seguros para carros.',
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
