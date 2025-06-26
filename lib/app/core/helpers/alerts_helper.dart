import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/widgets/error_dialog.dart';

abstract class AlertsHelper {
  static Future<void> showErrorDialog(
    BuildContext context,
    String message, {
    String title = 'Erro',
  }) {
    return showDialog(
      context: context,
      builder: (_) => ErrorDialog(message: message, title: title),
    );
  }
}
