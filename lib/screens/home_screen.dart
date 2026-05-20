import 'package:flutter/material.dart';
import 'custom_button.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         "Home Screen",
//         style: TextStyle(fontSize: 30),
//         )
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  void increaseCount() {
    setState(() {
      count++;
    });
  }

  void decreaseCount() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Widget Practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value $count",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            CustomButton(
              text: "Increase", 
              onPressed: increaseCount, 
              color: Colors.green, 
              icon: Icons.add,
              ),
              const SizedBox(height: 20,),
              CustomButton(text: "Decrease",
               onPressed: decreaseCount, 
               color: Colors.red,
              icon: Icons.remove,)
          ],
        ),
        ),
    );
  }
}
