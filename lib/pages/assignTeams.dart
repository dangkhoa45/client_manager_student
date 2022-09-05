import 'package:flutter/material.dart';
import 'package:flutter_client_manager_student/api/ApiService.dart';
import 'package:flutter_client_manager_student/pages/studentListPage.dart';

List<String> items = <String>[
  'Team 1',
  'Team 2',
  'Team 3',
  'Team 4',
  'Team 5',
];

class AssginTeams extends StatefulWidget {
  @override
  State<AssginTeams> createState() => _AssginTeamsState();
}

class _AssginTeamsState extends State<AssginTeams> {
  var api = ApiService();

  var listStudent = [];
  String dropdownValue = items.first;
  var nameController = TextEditingController();

  void getStudent() async {
    listStudent = await api.getAllStudent();
    //studentName = await api.getStudentName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) getStudent();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Student List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
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
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Reassign a team for an existing student',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                hintText: 'Student Name that needs to be reassigned (teams)'),
          ),
          SizedBox(
            width: 900,
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
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.grey),
            onPressed: () {
              api.editStudent(nameController.text, dropdownValue);
              // api.getStudentName(nameController.text);
            },
            child: Text(
              'Update',
              style: TextStyle(fontSize: 20),
            ),
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
