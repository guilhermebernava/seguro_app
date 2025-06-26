import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguro_app/app/core/widgets/custom_drawer/bottom_container.dart';
import 'package:seguro_app/app/core/widgets/custom_drawer/controller/drawer_controller.dart';
import 'package:seguro_app/app/core/widgets/custom_drawer/custom_list_tile.dart';
import 'package:seguro_app/app/core/widgets/custom_drawer/header_drawer.dart';
import 'package:seguro_app/app/core/widgets/custom_drawer/logout_button.dart';
import 'package:seguro_app/app/shared/stores/user_store.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Modular.get<UserStore>();
    final controller = Modular.get<DrawerControllerApp>();
    final drawerItems = controller.getDrawerItems();

    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            HeaderDrawer(store: store),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: drawerItems.length + 1,
                itemBuilder: (context, index) {
                  if (index < drawerItems.length) {
                    final item = drawerItems[index];
                    return CustomListTile(
                      icon: item.icon,
                      title: item.title,
                      onTap: () => Modular.to.navigate(item.route),
                    );
                  } else {
                    return LogoutButton(store: store);
                  }
                },
              ),
            ),
            BottomContainer(),
          ],
        ),
      ),
    );
  }
}
