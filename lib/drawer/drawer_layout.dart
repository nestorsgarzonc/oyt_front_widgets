import 'package:flutter/material.dart';
import 'package:oyt_front_core/theme/theme.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({
    super.key,
    required this.drawerChild,
    required this.bodyChild,
    this.drawerWidth = 200,
  });

  final Widget drawerChild;
  final Widget bodyChild;
  final double drawerWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: CustomTheme.drawerBoxDecoration,
          padding: const EdgeInsets.all(15),
          width: drawerWidth,
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
