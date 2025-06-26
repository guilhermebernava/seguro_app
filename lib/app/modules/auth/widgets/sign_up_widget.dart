import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/helpers/formatters.dart';
import 'package:seguro_app/app/core/helpers/string_helper.dart';
import 'package:seguro_app/app/core/widgets/custom_button.dart';
import 'package:seguro_app/app/core/widgets/custom_input.dart';
import 'package:seguro_app/app/modules/auth/controllers/auth_controller.dart';

class SignUpWidget extends StatelessWidget {
  final AuthController controller;

  const SignUpWidget(this.controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomInput(
            placeholder: 'CPF',
            controller: controller.cpfController,
            keyboardType: TextInputType.number,
            inputFormatters: [Formatters.cpfMaskFormatter],
            validator: StringHelper.validateCpf,
            padding: EdgeInsetsGeometry.only(bottom: 20),
          ),

          CustomInput(
            placeholder: 'Senha',
            controller: controller.passwordController,
            obscureText: true,
            validator: StringHelper.validatePassword,
            padding: EdgeInsetsGeometry.only(bottom: 20),
          ),
          CustomButton(
            child: Text(
              'Cadastrar',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              await controller.createUser(context);
            },
            borderRadius: BorderRadius.circular(10),
            innerPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ],
      ),
    );
  }
}
