import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JsonPlaceholderWebView extends StatefulWidget {
  @override
  State<JsonPlaceholderWebView> createState() => _JsonPlaceholderWebViewState();
}

class _JsonPlaceholderWebViewState extends State<JsonPlaceholderWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse('https://jsonplaceholder.typicode.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Placeholder')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
