import 'package:flutter/material.dart';
import 'package:flutter_client_manager_student/pages/aboutPage.dart';
import 'package:flutter_client_manager_student/pages/addStudent.dart';
import 'package:flutter_client_manager_student/pages/assignTeams.dart';
import 'package:flutter_client_manager_student/pages/calendarpage.dart';
import 'package:flutter_client_manager_student/pages/studentListPage.dart';
import 'package:flutter_client_manager_student/pages/taskpage.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var currentPage = DrawerSections.calender;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.calender) {
      container = CalendarPage();
    } else if (currentPage == DrawerSections.tasks) {
      container = TaskPage();
    } else if (currentPage == DrawerSections.studentList) {
      container = StudentListPage();
    } else if (currentPage == DrawerSections.addAStudent) {
      container = AddStudent();
    } else if (currentPage == DrawerSections.assignTeams) {
      container = AssginTeams();
    } else if (currentPage == DrawerSections.about) {
      container = AboutPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Manager'),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadDrawer(),
              DrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget HeadDrawer() {
    return Scaffold();
  }

  Widget DrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Calender", Icons.calendar_month,
              currentPage == DrawerSections.calender ? true : false),
          menuItem(2, "Tasks", Icons.task_alt_outlined,
              currentPage == DrawerSections.tasks ? true : false),
          menuItem(3, "Student List", Icons.person_sharp,
              currentPage == DrawerSections.studentList ? true : false),
          menuItem(4, "Add a Student", Icons.person_add,
              currentPage == DrawerSections.addAStudent ? true : false),
          menuItem(5, "Assign Teams", Icons.people_sharp,
              currentPage == DrawerSections.assignTeams ? true : false),
          menuItem(6, "About", Icons.help,
              currentPage == DrawerSections.about ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.calender;
            } else if (id == 2) {
              currentPage = DrawerSections.tasks;
            } else if (id == 3) {
              currentPage = DrawerSections.studentList;
            } else if (id == 4) {
              currentPage = DrawerSections.addAStudent;
            } else if (id == 5) {
              currentPage = DrawerSections.assignTeams;
            } else if (id == 6) {
              currentPage = DrawerSections.about;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  calender,
  tasks,
  studentList,
  addAStudent,
  assignTeams,
  about,
  logout,
}
