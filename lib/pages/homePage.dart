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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 70, 100, 232),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Student Manager",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Dashbroad",
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
        leading: Icon(Icons.menu),
      ),
      body: ResponsiveLayout(
        moblieBody: MyMobileBody(),
        desktopApp: MyDesktopApp(),
      ),
    );
  }
}
