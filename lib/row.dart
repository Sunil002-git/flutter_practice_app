import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Example")
        ),

        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Icon(Icons.home, size: 40),
            Icon(Icons.favorite, size: 40),
            Icon(Icons.person, size: 40),
          ],
          ),
      );
  }
}
