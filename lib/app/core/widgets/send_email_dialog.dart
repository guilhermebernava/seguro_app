import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/widgets/custom_input.dart';

class SendEmailDialog extends StatelessWidget {
  final TextEditingController emailController;
  final VoidCallback onSend;

  const SendEmailDialog({
    Key? key,
    required this.emailController,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recuperar Senha'),
      content: CustomInput(
        controller: emailController,
        placeholder: 'Email',
        keyboardType: TextInputType.emailAddress,
      ),
      actions: [
        TextButton(
          onPressed: () => Modular.to.pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(onPressed: onSend, child: const Text('Enviar')),
      ],
    );
  }
}
