// ListView + Dynamic Lists
import 'package:flutter/material.dart';

class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Example")),

      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Sunil"),
            subtitle: Text("Flutter Developer"),
            trailing: Icon(Icons.person),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Rahul"),
            subtitle: Text("React Developer"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Kiran"),
            subtitle: Text("Django Developer"),
          ),
        ],
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> students = ["Sunil", "Kiran", "Mari", "Arun", "Varun"];

    return Scaffold(
      appBar: AppBar(title: Text("Students")),

      body: ListView.builder(
        itemCount: students.length,

        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(students[index]),
            subtitle: Text("Student ${index + 1}"),
          );
        },
      ),
    );
  }
}
