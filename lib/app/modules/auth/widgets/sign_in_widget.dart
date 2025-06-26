import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/helpers/formatters.dart';
import 'package:seguro_app/app/core/helpers/string_helper.dart';
import 'package:seguro_app/app/core/widgets/custom_checkbox.dart';
import 'package:seguro_app/app/core/widgets/custom_input.dart';
import 'package:seguro_app/app/core/widgets/custom_textbutton.dart';
import 'package:seguro_app/app/modules/auth/controllers/auth_controller.dart';

class SignInWidget extends StatefulWidget {
  final AuthController controller;

  const SignInWidget(this.controller, {super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: Column(
        children: [
          CustomInput(
            placeholder: 'CPF',
            controller: widget.controller.cpfController,
            keyboardType: TextInputType.number,
            inputFormatters: [Formatters.cpfMaskFormatter],
            validator: StringHelper.validateCpf,
            padding: EdgeInsetsGeometry.only(bottom: 20),
          ),

          CustomInput(
            placeholder: 'Senha',
            controller: widget.controller.passwordController,
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckbox(
                  value: rememberUser,
                  onChanged: (bool? value) {
                    setState(() {
                      rememberUser = !rememberUser;
                    });
                  },
                  label: 'Lembrar sempre',
                ),
                CustomTextButton(
                  text: 'Esqueceu a senha ?',
                  onPressed: () => {print('cliquei')},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
