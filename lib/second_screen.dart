import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  // const SecondScreen({super.key});
  final String username;

  const SecondScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Text("Hello $username",
        style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
