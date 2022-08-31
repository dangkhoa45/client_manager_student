import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 5,
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Task Manager",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              backgroundColor: Colors.white,
            ),
            PhysicalModel(
              color: Colors.black54,
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 80.0, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'New Task',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    suffixIcon: SizedBox(
                      width: 70.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month),
                          Icon(Icons.color_lens),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "CLEAR FINISHED",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.grey.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
