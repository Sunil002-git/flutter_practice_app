import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Example"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            "Sunil",
            style: TextStyle(fontSize: 30),
          ),

          Text(
            "Flutter Developer",
            style: TextStyle(fontSize: 20),
          ),

          Text(
            "India",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

// Important Column Properties
// Property	Meaning
// children	: Widgets inside
// mainAxisAlignment :	Vertical alignment
// crossAxisAlignment	: Horizontal alignment