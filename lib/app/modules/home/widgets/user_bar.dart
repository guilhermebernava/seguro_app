import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';
import 'package:seguro_app/app/modules/home/widgets/user_image_name.dart';

class UserBar extends StatelessWidget {
  final UserEntity? user;

  const UserBar({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: UserImageName(user: user),
      ),
    );
  }
}
