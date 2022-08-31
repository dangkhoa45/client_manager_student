import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_manager_student/pages/calendarpage.dart';
import 'package:flutter_client_manager_student/pages/studentListPage.dart';
import 'package:flutter_client_manager_student/pages/taskpage.dart';

class MyDesktopApp extends StatelessWidget {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text(
                    "Student Manager",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Dashbroad"),
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
                title: 'Logout',
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
                  color: Colors.white,
                  child: StudentListPage(),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
