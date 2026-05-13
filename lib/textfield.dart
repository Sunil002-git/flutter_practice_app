import 'package:flutter/material.dart';
// TextField
// TextEditingController
// TextField(
//   decoration: InputDecoration(
//     labelText: "Enter Name",
//   ),
// )

class InputApp extends StatefulWidget {
  const InputApp({super.key});

  @override
  State<InputApp> createState() => _InputAppState();
}

class _InputAppState extends State<InputApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = "";
  String city = "";
  String email = "";
  String password = "";
  bool isHidden = true;
@override
void dispose() {
  nameController.dispose();
  cityController.dispose();
  emailController.dispose();
  passwordController.dispose();

  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
       child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Enter Name",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  username = nameController.text;
                });
              },
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: cityController,

              decoration: const InputDecoration(
                labelText: "Enter City",
                hintText: "Your city",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  city = cityController.text;
                });
              },
              child: const Text("Submit for City"),
            ),

            const SizedBox(height: 20),

            Text("Hello $username", style: const TextStyle(fontSize: 30)),
            Text("Your in $city city", style: const TextStyle(fontSize: 30)),

            TextField(
              controller: emailController,

              decoration: const InputDecoration(
                labelText: "Enter Email",
                hintText: "Your email",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
  controller: passwordController,

  obscureText: isHidden,

  decoration: InputDecoration(
    labelText: "Enter Password",
    hintText: "Your password",
    border: OutlineInputBorder(),

    suffixIcon: IconButton(

      icon: Icon(
        isHidden
            ? Icons.visibility_off
            : Icons.visibility,
      ),

      onPressed: () {

        setState(() {
          isHidden = !isHidden;
        });

      },
    ),
  ),
),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  email = emailController.text;
                  password = passwordController.text;
                });
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),

            Text("Your Email is $email and password is $password", style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
      ),
    );
  }
}
