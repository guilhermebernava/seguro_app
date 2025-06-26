import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/app_module.dart';
import 'package:seguro_app/app/data/firebase/firebase_auth_datasource.dart';
import 'package:seguro_app/app/data/repositories/auth_repository_imp.dart';
import 'package:seguro_app/app/domain/repositories/auth_repository.dart';
import 'package:seguro_app/app/modules/auth/AuthPage.dart';
import 'package:seguro_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseAuthDataSource>(() => FirebaseAuthDataSource());

    i.addLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(i<FirebaseAuthDataSource>()),
    );

    i.addLazySingleton<AuthController>(
      () => AuthController(i<AuthRepository>(), i<UserStore>()),
    );
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) {
        final controller = Modular.get<AuthController>();
        return AuthPage(controller: controller);
      },
    );
  }
}
