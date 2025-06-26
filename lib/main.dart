import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/app_module.dart';
import 'package:seguro_app/app/app_widget.dart';
import 'package:seguro_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
