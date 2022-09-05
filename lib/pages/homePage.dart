import 'package:flutter/material.dart';
import 'package:flutter_client_manager_student/pages/responsive/desktop_body.dart';
import 'package:flutter_client_manager_student/pages/responsive/mobile_body.dart';
import 'package:flutter_client_manager_student/pages/responsive/responsive_layout.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        moblieBody: MyMobileBody(),
        desktopApp: MyDesktopApp(),
      ),
    );
  }
}
