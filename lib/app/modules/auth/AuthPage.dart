import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/widgets/page_padding.dart';
import 'package:seguro_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:seguro_app/app/modules/auth/widgets/header_auth.dart';
import 'package:seguro_app/app/modules/auth/widgets/sign_in_widget.dart';
import 'package:seguro_app/app/modules/auth/widgets/sign_up_widget.dart';
import 'package:seguro_app/app/modules/auth/widgets/social_buttons.dart';
import 'package:seguro_app/app/modules/auth/widgets/toggle_widget/toggle_widget.dart';
import 'package:seguro_app/app/modules/auth/widgets/half_gradient_background.dart';
import 'package:seguro_app/app/modules/auth/widgets/toggle_widget/toggle_widget_web.dart';

class AuthPage extends StatelessWidget {
  final AuthController controller;

  const AuthPage({super.key, required this.controller});

  Widget build(BuildContext context) {
    return Scaffold(
      body: HalfGradientBackground(
        child: PagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderAuth(),
              Spacer(),
              kIsWeb
                  ? ToggleWidgetWeb(
                      authController: controller,
                      SignIn: SignInWidget(controller),
                      SignUp: SignUpWidget(controller),
                    )
                  : ToggleWidget(
                      authController: controller,
                      SignIn: SignInWidget(controller),
                      SignUp: SignUpWidget(controller),
                    ),
              Spacer(),
              SocialButtons(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
