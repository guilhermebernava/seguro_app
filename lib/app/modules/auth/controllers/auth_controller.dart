import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/helpers/alerts_helper.dart';
import 'package:seguro_app/app/core/helpers/string_helper.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';
import 'package:seguro_app/app/domain/repositories/auth_repository.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class AuthController {
  final AuthRepository _authRepository;
  final UserStore _store;

  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthController(this._authRepository, this._store);

  Future<void> signIn(BuildContext context, bool saveUser) async {
    if (!formKey.currentState!.validate()) return;

    final cpf = cpfController.text;
    final password = passwordController.text;

    try {
      final result = await _authRepository.signInWithEmail(
        StringHelper.cpfToEmail(cpf),
        password,
      );

      if (!result.isSuccess) {
        throw Exception('Erro ao tentar fazer login.');
      }

      await _store.setUser(
        UserEntity(
          uid: result.data!.uid,
          email: result.data!.email,
          image: result.data!.image,
          name: result.data!.name,
        ),
        saveUser,
      );

      Modular.to.navigate('/home/');
    } catch (e) {
      AlertsHelper.showErrorDialog(context, e.toString());
    }
  }

  Future<void> signInWithGitHub(BuildContext context) async {
    try {
      final result = await _authRepository.signInWithGitHub();

      if (!result.isSuccess) {
        throw Exception('Erro ao tentar fazer login.');
      }

      await _store.setUser(
        UserEntity(
          uid: result.data!.uid,
          email: result.data!.email,
          image: result.data!.image,
          name: result.data!.name,
        ),
        true,
      );

      print(_store.state?.email);

      Modular.to.navigate('/home/');
    } catch (e) {
      AlertsHelper.showErrorDialog(context, e.toString());
    }
  }

  Future<void> createUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final cpf = cpfController.text;
    final password = passwordController.text;

    try {
      final result = await _authRepository.createUser(
        StringHelper.cpfToEmail(cpf),
        password,
      );

      if (!result.isSuccess) {
        throw Exception('Erro ao tentar criar o usuario');
      }

      _store.setUser(
        UserEntity(uid: result.data!.uid, email: result.data!.email),
        false,
      );

      Modular.to.navigate('/home/');
    } catch (e) {
      AlertsHelper.showErrorDialog(context, e.toString());
    }
  }

  void reset() {
    formKey.currentState?.reset();
    cpfController.clear();
    passwordController.clear();
  }
}
