import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/widgets/custom_drawer/controller/drawer_controller.dart';
import 'package:seguro_app/app/data/local/local_user_datasoruce.dart';
import 'package:seguro_app/app/data/repositories/user_repository_imp.dart';
import 'package:seguro_app/app/domain/repositories/user_repository.dart';
import 'package:seguro_app/app/modules/auth/AuthModule.dart';
import 'package:seguro_app/app/modules/home/HomeModule.dart';
import 'package:seguro_app/app/modules/splash/SplashModule.dart';
import 'package:seguro_app/app/modules/webview/webview_module.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LocalUserDataSource>(() => LocalUserDataSource());
    i.addLazySingleton<UserRepository>(
      () => UserRepositoryImpl(i<LocalUserDataSource>()),
    );
    i.addSingleton<UserStore>(() => UserStore(null, i<UserRepository>()));
    i.addLazySingleton(() => FirebaseAuth.instance);
    i.addLazySingleton(() => DrawerControllerApp());
  }
}

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) => [
    r.module(Modular.initialRoute, module: Splashmodule()),
    r.module('/home', module: HomeModule()),
    r.module('/auth', module: AuthModule()),
    r.module('/webview', module: WebviewModule()),
  ];
}
