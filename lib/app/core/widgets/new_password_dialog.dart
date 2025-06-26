import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/widgets/custom_input.dart';

class NewPasswordDialog extends StatelessWidget {
  final TextEditingController passwordController;
  final VoidCallback onConfirm;

  const NewPasswordDialog({
    Key? key,
    required this.passwordController,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Criar Nova Senha'),
      content: CustomInput(
        controller: passwordController,
        obscureText: true,
        placeholder: 'Nova Senha',
      ),
      actions: [
        TextButton(
          onPressed: () => Modular.to.pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(onPressed: onConfirm, child: const Text('Confirmar')),
      ],
    );
  }
}
