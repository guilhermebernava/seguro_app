import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:seguro_app/app/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:seguro_app/app/modules/home/controllers/home_controller.dart';
import 'package:seguro_app/app/modules/home/widgets/home_containers.dart';
import 'package:seguro_app/app/modules/home/widgets/user_bar.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Modular.get<UserStore>();
    final controller = Modular.get<HomeController>();

    print(store.state?.email);

    return Scaffold(
      key: controller.scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: controller.scaffoldKey),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          UserBar(user: store.state),
          HomeContainers(controller: controller),
        ],
      ),
    );
  }
}
