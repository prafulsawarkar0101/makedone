import 'package:flutter/material.dart';
import 'package:makecheck/firebase/auth.dart';
import 'package:makecheck/tasks/custom_appbar.dart';
import 'package:makecheck/widget_tree.dart';
import 'task_list.dart';
import 'components/task_add.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  // signout method
  Future<void> signOut() async {
    await AuthService().signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WidgetTree()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6C63FF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    // backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your asset image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'praful12@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: signOut),
          ],
        ),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: CustomAppBar(),
      ),

      body: MyTaskList(),
      // body: AddTask(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
        ],
        selectedItemColor: Color(0xFF6C63FF),
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (contex) => AddTask()));
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
