import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final String dueDate;

  TaskCard({
    required this.taskTitle,
    required this.taskDescription,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              taskDescription,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Due: $dueDate',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  color: Colors.redAccent,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
