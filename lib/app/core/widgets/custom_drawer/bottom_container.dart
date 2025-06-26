import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.16,
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(Icons.supervised_user_circle, size: 50),
            Text('Dúvidas ?', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              width: size.width * 0.4,
              child: Text(
                'Se precisar de alguma ajuda, entre em contato conosco!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
