import 'package:flutter/material.dart';
import 'package:seguro_app/app/domain/entities/drawer_item.dart';

class DrawerControllerApp {
  List<DrawerItemEntity> getDrawerItems() {
    return const [
      DrawerItemEntity(title: 'Home/Seguro', icon: Icons.home, route: '/home/'),
      DrawerItemEntity(
        title: 'Minhas Contratações',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Meus Sinistros',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Minha Familia',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Meus Bens',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Pagamentos',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Coberturas',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Validar Boleto',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Telefones Importantes',
        icon: Icons.settings,
        route: '/home/',
      ),
      DrawerItemEntity(
        title: 'Configurações',
        icon: Icons.settings,
        route: '/home/',
      ),
    ];
  }
}
