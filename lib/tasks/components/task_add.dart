import 'package:flutter/material.dart';
// import './task_firebase/fb_addtask.dart';
import './task_firebase/task_object.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makecheck/tasks/components/task_firebase/task_object.dart';

void addTaskToFirestore(Task task) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Adding task to Firestore
    await firestore.collection('tasks').add(task.toMap());

    print("Task Added Successfully!");
  } catch (e) {
    print("Failed to add task: $e");
  }
}
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  String _selectedPriority = 'Low'; // Default priority

  // Function to display date picker and update controller
  Future<void> _selectDueDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dueDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Add Task",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: const Color(0xFF6C63FF),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Task",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                controller: _taskTitleController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Task Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                controller: _taskDescriptionController,
                maxLines: 8,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Due Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                controller: _dueDateController,
                readOnly: true,
                onTap: () => _selectDueDate(context),
                decoration: InputDecoration(
                  hintText: 'Select due date',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Priority",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownButtonFormField<String>(
                value: _selectedPriority,
                items: ['Low', 'Medium', 'High'].map((String priority) {
                  return DropdownMenuItem<String>(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPriority = newValue!;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.all(6),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color:
                          Color(0xFF6C63FF), // Background color for the button
                      shape: BoxShape.circle, // Makes the background circular
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Adding to firebase
                          Task newTask = Task(
                            taskTitle: _taskTitleController.text,
                            taskDescription: _taskDescriptionController.text,
                            priority: _selectedPriority,
                            dueDate: _dueDateController.text,
                          );
                          addTaskToFirestore(newTask);
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Task Added Successfully')),
                    );
                    Navigator.pop(context);

                       
                      },
                      icon: const Icon(Icons.edit_note),
                      color: Colors.white, // Color of the icon
                      iconSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
