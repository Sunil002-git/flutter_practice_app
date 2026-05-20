import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:stockfolio_mobile/screens/home_screen.dart';
import 'package:stockfolio_mobile/screens/splash_screen.dart';

import 'providers/auth_provider.dart';

import 'providers/theme_provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(

    //   create: (_) => AuthProvider(),

    //   child: const MyApp(),
    // ),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
Widget build(BuildContext context) {

  final themeProvider =

      Provider.of<ThemeProvider>(
        context,
      );

  return MaterialApp(

    debugShowCheckedModeBanner: false,

    themeMode:
        themeProvider.currentTheme,

    theme: ThemeData(

      brightness: Brightness.light,

      primarySwatch: Colors.blue,
    ),

    darkTheme: ThemeData(

      brightness: Brightness.dark,

      primarySwatch: Colors.blue,
    ),

    home: const HomeScreen(),
  );
}
}
