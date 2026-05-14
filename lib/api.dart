import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class ApiExample extends StatefulWidget {
//   const ApiExample({super.key});

//   @override
//   State<ApiExample> createState() => _ApiExampleState();
// }

// class _ApiExampleState extends State<ApiExample> {
//   List users = [];

//   Future<void> fetchUsers() async {
//     final response = await http.get(
//       Uri.parse("https://jsonplaceholder.typicode.com/users"),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         users = jsonDecode(response.body);
//       });
//     } else {
//       // print("API Failed");
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Api Failed")));
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("API Example")),
//       body: users.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: const Icon(Icons.person),
//                   title: Text(users[index]['name']),
//                   subtitle: Text(users[index]['email']),
//                 );
//               },
//             ),
//     );
//   }
// }

// Future<void> : This function takes time
// Examples:
// API calls
// database calls
// file loading

// async: Functrions works asynchronously
// Asynchronously means events, processes, or communication that happen not at the same time or speed

// await http.get() : Wait until API finishes

// jsonDecode() : Converts: JSON String into: Dart List/Map

// initState() { : runs only once where build runs many times

class PostApiExample extends StatefulWidget {
  const PostApiExample({super.key});

  @override
  State<PostApiExample> createState() => _PostApiExampleState();
}

class _PostApiExampleState extends State<PostApiExample> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {"Content-Type": "application/json"},

      body: jsonEncode({
        "title": titleController.text,
        "body": bodyController.text,
      }),
    );
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Post Created")));

      titleController.clear();
      bodyController.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post API Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Enter Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bodyController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Enter Body",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                createPost();
              },
              child: const Text("Create Post"),
            ),
          ],
        ),
      ),
    );
  }
}
