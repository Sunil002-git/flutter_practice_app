import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {

  String? token;

  bool isLoggedIn = false;

  Future<void> login(

    String username,
    String password,

  ) async {

    final response = await http.post(

      Uri.parse(
        // "http://10.0.2.2:8000/api/token/",
        "http://127.0.0.1:8000/api/token/",
      ),

      headers: {
        "Content-Type": "application/json",
      },

      body: jsonEncode({

        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      token = data['access'];

      final prefs =
          await SharedPreferences.getInstance();

      await prefs.setString(
        'access_token',
        token!,
      );

      isLoggedIn = true;

      notifyListeners();

    } else {

      throw Exception("Login Failed");
    }
  }

  Future<void> checkLogin() async {

    final prefs =
        await SharedPreferences.getInstance();

    token = prefs.getString(
      'access_token',
    );

    if (token != null) {

      isLoggedIn = true;

      notifyListeners();
    }
  }

  Future<void> logout() async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove(
      'access_token',
    );

    token = null;

    isLoggedIn = false;

    notifyListeners();
  }
}
// extends ChangeNotifier : Provider can notify UI when state changes
// notifyListeners(): "Hey UI, rebuild now"