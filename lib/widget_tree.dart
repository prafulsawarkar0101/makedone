import 'package:flutter/material.dart';
import 'firebase/auth.dart';
import 'tasks/task_home.dart';
import 'auth/login.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().user,
      builder: (context,snapshot){
        if (snapshot.hasData){
            return const TaskHome();
        }
        else{
          return LoginPage();
        }

      });
  }
}