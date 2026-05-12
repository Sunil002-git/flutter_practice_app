import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Practice App")),

//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,

//             children: [
//               Container(
//                 width: 200,
//                 height: 200,

//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(20),
//                 ),

//                 child: Center(
//                   child: Text(
//                     "Flutter",
//                     style: TextStyle(fontSize: 30, color: Colors.white),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 30),

//               ElevatedButton(
//                 onPressed: () {
//                   print("Button Pressed");
//                 },
//                 child: Text("Press Me"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

class PracticeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice App")),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: 200,
                height: 200,

                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Center(
                  child: Text(
                    "Flutter",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  print("Button Pressed");
                },
                child: Text("Press Me"),
              ),
            ],
          ),
        ),
    );
  }
}
