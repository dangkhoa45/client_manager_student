import 'package:flutter/material.dart';

import '../api/ApiService.dart';
import 'studentListPage.dart';

List<String> items = <String>[
  'Team 1',
  'Team 2',
  'Team 3',
  'Team 4',
  'Team 5',
];

class AddStudent extends StatefulWidget {
  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  var api = ApiService();

  var listStudent = [];

  void getStudent() async {
    listStudent = await api.getAllStudent();
    setState(() {});
  }

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  String dropdownValue = items.first;

  @override
  Widget build(BuildContext context) {
    if (mounted) getStudent();
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
                controller: nameController,
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
                controller: emailController,
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
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    alignment: Alignment.centerRight,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade600,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: Text('Choose a gender: '),
              ),
              Container(
                child: SizedBox(
                  width: 200,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey),
                onPressed: () {
                  api.createStudent(nameController.text, emailController.text,
                      _value == 1 ? "M" : "F", dropdownValue);
                },
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FixedColumnWidth(40),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FixedColumnWidth(64),
              4: FixedColumnWidth(64)
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: Colors.grey),
                  children: [
                    tableCellContainer('No', fontWeight: FontWeight.bold),
                    tableCellContainer('Name', fontWeight: FontWeight.bold),
                    tableCellContainer('Email', fontWeight: FontWeight.bold),
                    tableCellContainer('Teams', fontWeight: FontWeight.bold),
                    tableCellContainer('Gender', fontWeight: FontWeight.bold)
                  ]),
              for (var i = 0; i < listStudent.length; i++)
                TableRow(children: [
                  tableCellContainer(listStudent[i]['id'].toString()),
                  tableCellContainer(listStudent[i]['name'].toString()),
                  tableCellContainer(listStudent[i]['email'].toString()),
                  tableCellContainer(listStudent[i]['team'].toString()),
                  tableCellContainer(
                      listStudent[i]['gender'] == 'M' ? 'Male' : 'Female'),
                ])
            ],
          ),
        ],
      ),
    );
  }

  Widget tableCellContainer(String text,
      {FontWeight fontWeight = FontWeight.normal}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        child: Text(
          text,
          style: TextStyle(fontWeight: fontWeight),
        ),
      ),
    );
  }
}
