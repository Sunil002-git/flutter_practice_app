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

// class FruitsList extends StatefulWidget {
//   const FruitsList({super.key});
//   @override
//   State<FruitsList> createState() => _FruitsListState();
// }
// class _FruitsListState extends State<FruitsList> {
//    TextEditingController fruitsController = TextEditingController();

//    @override
//   Widget build(BuildContext context) {
//     List<String> fruits = ["Apple", "Orange", "Mango", "Banana"];
//     return Scaffold(
//       appBar: AppBar(title: Text("Fruits List")),
//       body: ListView.builder(
//         itemCount: fruits.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Icon(Icons.arrow_back),
//             title: Text(fruits[index]),
//             subtitle: Text("Price ${index + 30}"),
//           );
//         },
//       ),
//       TextField(
//               controller: fruitsController,

//               decoration: const InputDecoration(
//                 labelText: "Enter Fruit",
//                 prefixIcon: Icon(Icons.person),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//       ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   fruits += fruitsController.text;
//                 });
//               },
//               child: const Text("Add Fruit"),
//             ),
//     );
//   }
// }

class FruitsList extends StatefulWidget {
  const FruitsList({super.key});

  @override
  State<FruitsList> createState() => _FruitsListState();
}

class _FruitsListState extends State<FruitsList> {
  TextEditingController fruitsController = TextEditingController();

  List<String> fruits = ["Apple", "Orange", "Mango", "Banana"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fruits List")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: fruitsController,
              decoration: const InputDecoration(
                labelText: "Enter Fruit",
                prefixIcon: Icon(Icons.apple),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (fruitsController.text.isNotEmpty) {
                    fruits.add(fruitsController.text);
                    fruitsController.clear();
                  } else {
                    // Text("Enter Data");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please Enter fruit name"),
                      ),
                    );
                  }
                });
              },
              child: const Text("AddFruit"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: fruits.length,

                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.shopping_cart),

                    title: Text(fruits[index]),

                    subtitle: Text("Price ${index + 30}"),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete),

                      onPressed: () {
                        setState(() {
                          fruits.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
