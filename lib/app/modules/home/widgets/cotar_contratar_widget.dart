import 'package:flutter/material.dart';
import 'package:seguro_app/app/modules/home/controllers/home_controller.dart';
import 'package:seguro_app/app/modules/home/widgets/custom_title.dart';
import 'package:seguro_app/app/modules/home/widgets/small_container.dart';

class CotarContratarWidget extends StatelessWidget {
  final HomeController controller;

  const CotarContratarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: 'Cotar e Contratar'),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
              SmallContainer(
                icon: Icons.directions_car,
                title: 'Automóvel',
                onTap: () async => await controller.openWebView(context),
              ),
              SmallContainer(
                icon: Icons.home_work_outlined,
                title: 'Residência',
              ),
              SmallContainer(
                icon: Icons.favorite_outline,
                title: 'Seguro de Vida',
              ),
              SmallContainer(
                icon: Icons.health_and_safety,
                title: 'Acidentes Pessoais',
              ),
              SmallContainer(
                icon: Icons.shield_outlined,
                title: 'Proteção Familiar',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
