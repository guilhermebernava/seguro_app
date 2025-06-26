import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final String title;

  const ErrorDialog({Key? key, required this.message, this.title = 'Erro'})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Modular.to.pop(), child: const Text('OK')),
      ],
    );
  }
}
