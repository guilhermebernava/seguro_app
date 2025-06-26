import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/app_module.dart';
import 'package:seguro_app/app/modules/webview/webview_page.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class WebviewModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) {
        final url = Modular.args.data as String;
        return WebViewPage(url: url, store: Modular.get<UserStore>());
      },
    );
  }
}
