import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class LogoutButton extends StatelessWidget {
  final UserStore store;

  const LogoutButton({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Text(
            'Sair',
            style: TextStyle(fontSize: 16, color: AppColors.primary),
          ),

          onTap: () async {
            await store.clearUser();
            Modular.to.navigate('/auth/');
          },
        ),
      ),
    );
  }
}
