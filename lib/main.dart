import 'package:first_demo/tasks_app/todo_home.dart';
import 'package:first_demo/tasks_app/util/responsive.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const Scaffold(    
        body: Center(child: Text('Responsive Design'))
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
