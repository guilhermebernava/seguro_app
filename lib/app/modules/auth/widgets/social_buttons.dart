import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/assets/app_images.dart';
import 'package:seguro_app/app/core/widgets/custom_text.dart';
import 'package:seguro_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:seguro_app/app/modules/auth/widgets/social_button.dart';

class SocialButtons extends StatelessWidget {
  final AuthController controller;

  const SocialButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: 'Acesse através das redes sociais', isParagraph: true),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              SocialButton(onTap: () {}, image: AppImages.googleIcon),
              SocialButton(
                onTap: () async => await controller.signInWithGitHub(context),
                image: AppImages.githubIcon,
              ),
              SocialButton(onTap: () {}, image: AppImages.facebookIcon),
            ],
          ),
        ),
      ],
    );
  }
}
