import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class NotificationButton extends StatelessWidget {
  final bool hasNotification;

  const NotificationButton({super.key, this.hasNotification = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            print('cliquei');
          },
          child: Container(
            height: 30,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.notifications_outlined, size: 27),
                hasNotification
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
