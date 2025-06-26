import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';

class UserImageName extends StatelessWidget {
  final UserEntity? user;
  final bool showMyAccount;
  final bool hasNotification;

  const UserImageName({
    super.key,
    this.user,
    this.showMyAccount = false,
    this.hasNotification = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                child: user?.image != null
                    ? ClipOval(
                        child: Image.network(
                          user!.image!,
                          fit: BoxFit.cover,

                          width: 50,
                        ),
                      )
                    : Icon(Icons.supervised_user_circle, size: 40),
              ),
              hasNotification
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Text('1', style: TextStyle(fontSize: 10)),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),

        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !showMyAccount
                ? Text('Seja Bem vindo,', style: TextStyle(fontSize: 12))
                : Container(),
            Text(
              user?.name ?? 'Usuário',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            showMyAccount
                ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        print('minha conta');
                      },
                      child: Row(
                        children: [
                          Text(
                            'Minha Conta',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primary,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 20),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
