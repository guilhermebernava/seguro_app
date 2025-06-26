import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/modules/home/widgets/user_image_name.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class HeaderDrawer extends StatelessWidget {
  final UserStore store;

  const HeaderDrawer({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: UserImageName(user: store.state, showMyAccount: true),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: AppColors.gray, // Cor da linha
          thickness: 1, // Espessura da linha
          height: 20, // Espaçamento vertical
        ),
      ],
    );
  }
}
