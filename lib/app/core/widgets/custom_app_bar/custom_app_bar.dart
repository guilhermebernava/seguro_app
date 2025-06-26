import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/assets/app_images.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/core/widgets/custom_app_bar/notification_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundCard,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      actions: [NotificationButton()],
      title: Center(
        child: Image.asset(AppImages.logo, fit: BoxFit.cover, width: 45),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
