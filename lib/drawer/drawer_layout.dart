import 'package:flutter/material.dart';
import 'package:oyt_front_core/theme/theme.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({super.key, required this.drawerChild, required this.bodyChild});

  final Widget drawerChild;
  final Widget bodyChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: CustomTheme.drawerBoxDecoration,
          padding: const EdgeInsets.all(15),
          width: 200,
          height: double.infinity,
          child: drawerChild,
        ),
        Expanded(
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: bodyChild,
          ),
        ),
      ],
    );
  }
}
