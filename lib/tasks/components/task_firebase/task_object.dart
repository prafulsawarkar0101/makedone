import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id; // Optional, to store Firestore document ID
  String taskTitle;
  String taskDescription;
  String priority;
  String dueDate;

  Task({
    this.id = '',
    required this.taskTitle,
    required this.taskDescription,
    required this.priority,
    required this.dueDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'task_title': taskTitle,
      'task_description': taskDescription,
      'priority': priority,
      'due_date': dueDate,
    };
  }

  // Factory to create a Task from Firestore document snapshot
  factory Task.fromDocument(DocumentSnapshot doc) {
    return Task(
      id: doc.id,
      taskTitle: doc['task_title'],
      taskDescription: doc['task_description'],
      priority: doc['priority'],
      dueDate: doc['due_date'],
    );
  }
}
