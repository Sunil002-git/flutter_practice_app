// import 'package:flutter/material.dart';

// class practise2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Practise 2 App"),
//       ),
//         body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,

//               children: [
//                 Container(
//                   width: 200,
//                   height: 200,

//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                     child: Text("Hello",
//                     style: TextStyle(fontSize: 30, color: Colors.red),
//                     ),
                    
//                   ),
                  
//                 ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

//                       children: [
//                         Icon(Icons.home, size: 40),
//                         Icon(Icons.favorite, size: 40),
//                         Icon(Icons.person, size: 40),
//                       ],
//                       ),

//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Name", style: TextStyle(fontSize: 30),),
//                            SizedBox(height: 30),
//                           Text("Phone", style: TextStyle(fontSize: 30),),
//                            SizedBox(height: 30),
//                           Text("Email", style: TextStyle(fontSize: 30),),
//                       ],)
//               ],
//             ),
            
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Practice2 extends StatelessWidget {
  const Practice2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice 2 App"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
              width: 200,
              height: 200,

              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Center(
                child: Text(
                  "Hello",

                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: const [
                Icon(Icons.home, size: 40),
                Icon(Icons.favorite, size: 40),
                Icon(Icons.person, size: 40),
              ],
            ),

            const SizedBox(height: 30),

            Column(
              children: const [

                Text(
                  "Name",
                  style: TextStyle(fontSize: 30),
                ),

                SizedBox(height: 20),

                Text(
                  "Phone",
                  style: TextStyle(fontSize: 30),
                ),

                SizedBox(height: 20),

                Text(
                  "Email",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}