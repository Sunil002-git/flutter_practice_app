import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('access_token');
  }

  TextEditingController taskController = TextEditingController();
  List tasks = [];

  Future<void> fetchTasks() async {
    String? token = await getToken();
    final response = await http.get(
      Uri.parse("http://127.0.0.1:8000/api/tasks/"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      setState(() {
        tasks = jsonDecode(response.body);
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Unauthorized")));
    }
  }

  Future<void> createTask() async {
    String? token = await getToken();
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/tasks/"),

      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
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

  Future<void> deleteTask(int id) async {
    String? token = await getToken();
    final response = await http.delete(
      Uri.parse("http://127.0.0.1:8000/api/tasks/delete/$id/"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      fetchTasks();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Delete Failed")));
    }
  }

  Future<void> updateTask(int id, String title, bool completed) async {
    String? token = await getToken();
    final response = await http.put(
      Uri.parse("http://127.0.0.1:8000/api/tasks/update/$id/"),

      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },

      body: jsonEncode({"title": title, "completed": !completed}),
    );

    if (response.statusCode == 200) {
      fetchTasks();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Update Failed")));
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  void initState() {
    super.initState();

    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Django Tasks"),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

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
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: tasks.length,

                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),

                        child: ListTile(
                          leading: Checkbox(
                            value: tasks[index]['completed'],

                            onChanged: (value) {
                              updateTask(
                                tasks[index]['id'],

                                tasks[index]['title'],

                                tasks[index]['completed'],
                              );
                            },
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),

                            onPressed: () {
                              deleteTask(tasks[index]['id']);
                            },
                          ),

                          title: Text(
                            tasks[index]['title'],

                            style: TextStyle(
                              decoration: tasks[index]['completed']
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),

                          subtitle: Text(
                            tasks[index]['completed'] ? "Completed" : "Pending",
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
