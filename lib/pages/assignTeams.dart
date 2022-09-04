import 'package:flutter/material.dart';
import 'package:flutter_client_manager_student/pages/studentListPage.dart';

class assginTeams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Text(
            'Reassign a team for an existing student',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Student Name that needs to be reassigned (teams)'),
          ),
          SizedBox(
            width: 900,
            child: DropdownButtonItems(),
          ),
        ],
      ),
    );
  }
}
