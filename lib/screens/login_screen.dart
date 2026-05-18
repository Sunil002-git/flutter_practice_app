import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockfolio_mobile/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:stockfolio_mobile/providers/auth_provider.dart';
import 'bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Future<void> login() async {
  //   final response = await http.post(
  //     Uri.parse("http://127.0.0.1:8000/api/token/"),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({
  //       "username": usernameController.text,
  //       "password": passwordController.text,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('access_token', data['access']);
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(const SnackBar(content: Text("Login Success")));
  //     Navigator.pushReplacement(
  //       context,

  //       MaterialPageRoute(builder: (context) => const TaskScreen()),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
  //   }
  // }
 Future<void> login() async {

  try {

    final authProvider =

        Provider.of<AuthProvider>(
          context,
          listen: false,
        );

    await authProvider.login(

      usernameController.text,

      passwordController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(
        content: Text("Login Success"),
      ),
    );

    Navigator.pushReplacement(

      context,

      MaterialPageRoute(

        builder: (context) =>
            const BottomNavScreen(),
      ),
    );

  } catch (e) {

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(
        content: Text("Invalid Credentials"),
      ),
    );
  }
}
  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('access_token');

    print(token);

    if (token != null) {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => const TaskScreen()),
      );
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
