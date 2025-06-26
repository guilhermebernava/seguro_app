import 'package:flutter/material.dart';

class DrawerItemEntity {
  final String title;
  final IconData icon;
  final String route;

  const DrawerItemEntity({
    required this.title,
    required this.icon,
    required this.route,
  });
}
