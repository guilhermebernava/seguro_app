import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/helpers/alerts_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final String _url = 'https://jsonplaceholder.typicode.com/';

  Future<void> openWebView(BuildContext context) async {
    if (kIsWeb) {
      if (!await launchUrl(Uri.parse(_url)))
        AlertsHelper.showErrorDialog(
          context,
          'Erro ao tentar abrir a URL ${_url}',
        );

      return;
    }
    ;
    Modular.to.navigate('/webview/', arguments: _url);
  }
}
