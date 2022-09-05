import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_manager_student/pages/aboutPage.dart';
import 'package:flutter_client_manager_student/pages/assignTeams.dart';
import 'package:flutter_client_manager_student/pages/calendarpage.dart';
import 'package:flutter_client_manager_student/pages/studentListPage.dart';
import 'package:flutter_client_manager_student/pages/taskpage.dart';

import '../addStudent.dart';

class MyDesktopApp extends StatelessWidget {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 184, 186, 195),
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
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dang Khoa",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "dangkhoa@ivs0251.vitenet.net",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                    thickness: 2.0,
                  ),
                ],
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Calendar',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.calendar_month),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Tasks',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.task_alt_outlined),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Student List',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.person_sharp),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Add a Student',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.person_add),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Assign Teams',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: const Icon(Icons.people_sharp),
              ),
              SideMenuItem(
                priority: 5,
                title: 'About',
                onTap: () {
                  page.jumpToPage(5);
                },
                icon: const Icon(Icons.help),
              ),
              SideMenuItem(
                priority: 6,
                title: 'Log out',
                onTap: () {
                  page.jumpToPage(6);
                },
                icon: const Icon(Icons.input),
              ),
            ],
            controller: page,
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  child: CalendarPage(),
                ),
                Container(
                  child: TaskPage(),
                ),
                Container(
                  child: StudentListPage(),
                ),
                Container(
                  child: AddStudent(),
                ),
                Container(
                  child: AssginTeams(),
                ),
                Container(
                  child: AboutPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
