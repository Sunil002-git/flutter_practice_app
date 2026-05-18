import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'task_screen.dart';
import 'profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  final List screens = [
    const HomeScreen(),
    const TaskScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.task),
          label: "Tasks",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: "Profile"
          ),
        ],
      ),
    );
  }
}


// int currentIndex = 0; => which tab is selected
// final List screens = [...] => Stores all pages.
// body: screens[currentIndex] => Show current selected screen
// onTap: (index) => Runs when user taps tab.
// currentIndex = index; => changes selected screen.