import 'package:flutter/material.dart';

// class MyPage extends StatefulWidget {
//   const MyPage({super.key});

//   @override
//   State<MyPage> createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {

// }

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;
  String greet = "";
  Color bgColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("$count", style: TextStyle(fontSize: 40)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text("Increase"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              child: const Text("Decrease"),
            ),

            Text(
              greet, style: TextStyle(fontSize: 30),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  greet = "Hello → Welcome";
                });
              },
              child: const Text("Show Greeting"),
            ),

            Container(
              width: 200,
              height: 100,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: bgColor,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                 bgColor = Colors.red;
                });
              },
              child: const Text("Chnage Color"),
            ),
          ],
        ),
      ),
    );
  }
}
