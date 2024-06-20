import 'package:first_demo/tasks_app/util/dialog_widget.dart';
import 'package:first_demo/tasks_app/util/task_widget.dart';
import 'package:flutter/material.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final controller = TextEditingController();
  List taskList = [];

  void taskComleted(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      taskList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.pop(context);
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void createNewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          controller: controller,
          onSave: () {
            saveNewTask();
          },
          onCancel: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 65, 112),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 75, 132),
          title: const Text(
            'Task App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            createNewtask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              taskName: taskList[index][0],
              taskCompleted: taskList[index][1],
              onChanged: (value) => taskComleted(value, index),
              onDelete: (value) => deleteTask(index),
            );
          },
        ));
  }
}
