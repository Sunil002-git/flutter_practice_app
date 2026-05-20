import 'package:flutter/material.dart';
import 'package:stockfolio_mobile/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen(
                username: "Sunil",
              )),
            );
          },
          child: const Text("Go to Second Screen"),
        ),
      ),
    );
  }
}
