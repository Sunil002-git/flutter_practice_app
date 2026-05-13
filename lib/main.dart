import 'package:flutter/material.dart';
import 'column.dart';
import 'listview.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stockfolio',
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Stockfolio App')),
//       body: Center(
//         child: Text('Flutter is Working 🚀', style: TextStyle(fontSize: 24)),
//       ),
//     );
//   }
// }
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(

//       appBar: AppBar(title: Text("Profile App"),),
//       body: Center(
//         child: Text(
//           "Welcome to Flutter",
//           style: TextStyle(
//             fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(appBar: AppBar(title: Text("Profile App"),
//       backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Text("Hello Sunil",
//         style: TextStyle(
//           fontSize: 24,
//           color: Colors.yellow,
//           backgroundColor: Colors.black,
//           fontWeight: FontWeight.bold,
//         )
//         ),
//       )
//       ),

//     ),
//   );
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Text Widget"),
//         ),
//         body: Center(
//           child: Text(
//             "Flutter Learning",
//             style: TextStyle(
//               fontSize: 28,
//               color: Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//   ),
//  ),
// );
// }

// 2. Container
// void main() {
//   runApp(

//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Container Example"),
//           ),
//           body: Center(
//             child: Container(
//               width:250,
//               height: 250,

//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: Center(
//                 child : Text(
//                   "Inside Container",
//                   style: TextStyle(
//                     fontSize: 22,
//                     color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),

//       ),
//     ),
//   );
// }

// 3 Column
// 4 Row
// import 'row.dart';
// import 'padding.dart';
// import 'practice.dart';
// import 'practise_2.dart';
// import 'stateful_widget.dart';
import 'textfield.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ColumnPage(),
      // home: RowPage(),
      // home: PaddingPage(),
      // home: PracticeApp(),
      home: StudentList(),
    ),
  );
}
