import 'package:flutter/material.dart';

class PagePadding extends StatelessWidget {
  final Widget child;

  const PagePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 50, left: 40, right: 40),
      child: child,
    );
  }
}
