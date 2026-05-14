import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController taskController = TextEditingController();
  List tasks = [];

  Future<void> fetchTasks() async {
    final response = await http.get(
      Uri.parse("http://127.0.0.1:8000/api/tasks/"),
    );

    if (response.statusCode == 200) {
      setState(() {
        tasks = jsonDecode(response.body);
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed To Load Tasks")));
    }
  }

  Future<void> createTask() async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/tasks/"),

      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": taskController.text, "completed": false}),
    );

    if (response.statusCode == 201) {
      taskController.clear();
      fetchTasks();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed To Add Task")));
    }
  }

  @override
  void initState() {
    super.initState();

    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Django Tasks")),

      body: Column(

  children: [

    Padding(
      padding: const EdgeInsets.all(10),

      child: Row(

        children: [

          Expanded(

            child: TextField(

              controller: taskController,

              decoration: const InputDecoration(
                hintText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(width: 10),

          ElevatedButton(

            onPressed: () {

              createTask();

            },

            child: const Text("Add"),
          ),
        ],
      ),
    ),

    Expanded(

      child: tasks.isEmpty

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : ListView.builder(

              itemCount: tasks.length,

              itemBuilder:
                  (context, index) {

                return Card(

                  margin:
                      const EdgeInsets.all(10),

                  child: ListTile(

                    leading: const Icon(
                      Icons.task,
                    ),

                    title: Text(
                      tasks[index]['title'],
                    ),

                    subtitle: Text(

                      tasks[index]['completed']
                          ? "Completed"
                          : "Pending",
                    ),
                  ),
                );
              },
            ),
    ),
  ],
), 
      
    );
  }
}
