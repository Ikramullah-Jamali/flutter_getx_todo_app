import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_app_practice/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Todo App',
      home: HomeScreen(),
    );
  }
}