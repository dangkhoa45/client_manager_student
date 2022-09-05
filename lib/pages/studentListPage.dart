import 'package:flutter/material.dart';

import '../api/ApiService.dart';

List<String> items = <String>[
  'Team 1',
  'Team 2',
  'Team 3',
  'Team 4',
  'Team 5',
];

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  int _value = 1;

  String dropdownValue = items.first;

  var api = ApiService();

  var listStudent = [];

  //Get Student
  void getStudent() async {
    listStudent = await api.getAllStudent();
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    if (mounted) getStudent();
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Student List",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Search by name",
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Search by email",
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Gender"),
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
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 800,
                      child: DropdownButtonItems(),
                    ),
                  ],
                ),
              ],
            ),
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
}

class DropdownButtonItems extends StatefulWidget {
  const DropdownButtonItems({super.key});

  @override
  State<DropdownButtonItems> createState() => _DropdownButtonItemsState();
}

class _DropdownButtonItemsState extends State<DropdownButtonItems> {
  String dropdownValue = items.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
    );
  }
}
