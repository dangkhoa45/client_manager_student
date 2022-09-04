import 'package:flutter/material.dart';

import 'studentListPage.dart';

class addStudent extends StatelessWidget {
  const addStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Add a Student",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Student Name',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: SizedBox(
                  width: 500,
                  child: DropdownButtonItems(),
                ),
              ),
              Container(
                child: Gender(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Gender extends StatefulWidget {
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Text('Choose a gender: '),
          RadioListTile(
            value: 1,
            groupValue: _value,
            onChanged: (int? value) {
              setState(() {
                _value = value ?? 1;
              });
            },
            activeColor: Colors.grey.shade600,
            title: Text(
              'Male',
              style: TextStyle(fontSize: 15),
            ),
          ),
          RadioListTile(
            value: 2,
            groupValue: _value,
            onChanged: (int? value) {
              setState(() {
                _value = value ?? 1;
              });
            },
            activeColor: Colors.grey.shade600,
            title: Text(
              'Female',
              style: TextStyle(fontSize: 15),
            ),
          ),
          RadioListTile(
            value: 3,
            groupValue: _value,
            onChanged: (int? value) {
              setState(() {
                _value = value ?? 1;
              });
            },
            activeColor: Colors.grey.shade600,
            title: Text(
              'All',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
