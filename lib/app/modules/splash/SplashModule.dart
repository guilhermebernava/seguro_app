import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/app_module.dart';
import 'package:seguro_app/app/modules/splash/SplashPage.dart';

class Splashmodule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => SplashPage());
  }
}
