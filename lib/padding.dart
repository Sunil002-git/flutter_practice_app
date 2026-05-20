import 'package:flutter/material.dart';

// Adds space INSIDE around widgets.
class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(40),
      child: Text(
        "Padding Example",
        style: TextStyle(fontSize: 28),
      ),
      ),
    );
  }
}

// EdgeInsets.all(20)
// All sides.

// EdgeInsets.symmetric(
//   horizontal: 20,
//   vertical: 10,
// )

// EdgeInsets.only(
//   top: 20,
//   left: 10,
// )
