import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/modules/home/widgets/custom_title.dart';

class BigContainer extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String? text;

  const BigContainer({
    super.key,
    required this.title,
    required this.iconData,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        CustomTitle(title: title),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              print('cliquei');
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: size.width, minHeight: 180),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 25,
                    children: [
                      Icon(iconData, size: 60),
                      text != null
                          ? Text(
                              text!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
