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

  TextEditingController searchController = TextEditingController();
  List filteredTasks = [];
  Future<void> fetchTasks() async {
    String? token = await getToken();
    final response = await http.get(
      Uri.parse("http://127.0.0.1:8000/api/tasks/"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      setState(() {
        tasks = jsonDecode(response.body);
        filteredTasks = tasks;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Unauthorized")));
    }
  }

  void searchTasks(String query) {
    setState(() {
      filteredTasks = tasks.where((task) {
         String title =
          task['title']?.toString() ?? '';
        return title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> createTask() async {
    String? token = await getToken();
    if (taskController.text.trim().isEmpty) {

  ScaffoldMessenger.of(context).showSnackBar(

    const SnackBar(
      content: Text("Enter Task"),
    ),
  );

  return;
}
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
        title: const Text(
          "My Tasks",

          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        centerTitle: true,

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

  padding: const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  ),

  child: TextField(

    controller: searchController,

    onChanged: (value) {

      searchTasks(value);

    },

    decoration: InputDecoration(

      hintText: "Search Tasks",

      prefixIcon:
          const Icon(Icons.search),

      filled: true,

      fillColor: Colors.white,

      border: OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(15),

        borderSide: BorderSide.none,
      ),
    ),
  ),
),
          Padding(
            
            padding: const EdgeInsets.all(15),

            child: Row(
              children: [
                Expanded(
                  
                  child: TextField(
                    controller: taskController,

                    decoration: InputDecoration(
                      hintText: "Enter Task",

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    createTask();
                  },

                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          Expanded(
            child: RefreshIndicator(

    onRefresh: fetchTasks,
            child: filteredTasks.isEmpty
                ? ListView(

            children: const [

              SizedBox(height: 300),

              Center(

                child: Text(

                  "No Tasks Available",

                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )

                : ListView.builder(
                    itemCount: filteredTasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),

                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),

                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),

                          leading: Checkbox(
                            value: filteredTasks[index]['completed'],

                            onChanged: (value) {
                              updateTask(
                                filteredTasks[index]['id'],

                                filteredTasks[index]['title'],

                                filteredTasks[index]['completed'],
                              );
                            },
                          ),

                          title: Text(
                            filteredTasks[index]['title'],

                            style: TextStyle(
                              fontSize: 18,

                              fontWeight: FontWeight.w600,

                              decoration: filteredTasks[index]['completed']
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),

                          subtitle: Text(
                            filteredTasks[index]['completed'] ? "Completed" : "Pending",

                            style: TextStyle(
                              color: filteredTasks[index]['completed']
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),

                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),

                            onPressed: () {
                              deleteTask(filteredTasks[index]['id']);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          ),
        ],
      ),
    );
  }
}
