import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "The project is in the process of being updated. We will try to update as quickly as possible. Thank you for your experience"),
      ),
    );
  }
}
