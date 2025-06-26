import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/app_module.dart';
import 'package:seguro_app/app/modules/home/HomePage.dart';
import 'package:seguro_app/app/modules/home/controllers/home_controller.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => HomeController());
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => HomePage());
  }
}
