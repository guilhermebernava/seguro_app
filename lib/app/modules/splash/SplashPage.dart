import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/assets/app_images.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    final store = Modular.get<UserStore>();

    await store.existUser();

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(Duration(seconds: 2), () {
      Modular.to.navigate(store.state != null ? '/home/' : '/auth/');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width > 600 ? size.width * 0.25 : size.width * 0.5;

    return Container(
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
          child: Image.asset(AppImages.logo, width: width, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
