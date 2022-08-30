import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget moblieBody;
  final Widget desktopApp;

  const ResponsiveLayout({
    super.key,
    required this.moblieBody,
    required this.desktopApp,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 600) {
          return moblieBody;
        } else {
          return desktopApp;
        }
      }),
    );
  }
}
