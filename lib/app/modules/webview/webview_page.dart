import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final UserStore store;

  const WebViewPage({super.key, required this.url, required this.store});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.store.state != null
                ? Modular.to.navigate('/home/')
                : Modular.to.navigate('/auth/');
          },
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
