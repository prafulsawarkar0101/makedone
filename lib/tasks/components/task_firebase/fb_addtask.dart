import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makecheck/tasks/components/task_firebase/task_object.dart';

void addTaskToFirestore(Task task) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  await firestore.collection('tasks').add(task.toMap());
}


void deleteTaskFromFirestore(String taskId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  await firestore.collection('tasks').doc(taskId).delete();
}
