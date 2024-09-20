import 'package:flutter/material.dart';
import 'components/task_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyTaskList extends StatefulWidget {
  @override
  State<MyTaskList> createState() => _MyTaskListState();
}

class _MyTaskListState extends State<MyTaskList> {

  Future<List<Map<String, dynamic>>> _fetchTasks() async {
    // Fetch tasks from Firestore
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('tasks').get();

    return querySnapshot.docs.map((doc) {
      return {
        'taskTitle': doc['taskTitle'],
        'taskDescription': doc['taskDescription'],
        'dueDate': doc['dueDate'],
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching tasks.'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No tasks available.'));
        } else {
          // If tasks are available, display them
          List<Map<String, dynamic>> tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskTitle: tasks[index]['taskTitle'],
                taskDescription: tasks[index]['taskDescription'],
                dueDate: tasks[index]['dueDate'],
              );
            },
          );
        }
      },
    );
  }
}
