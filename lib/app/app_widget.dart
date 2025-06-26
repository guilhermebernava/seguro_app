import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Seguro App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}
