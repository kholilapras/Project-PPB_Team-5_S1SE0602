import 'package:flutter/material.dart';
import 'create_task_screen.dart'; // Import file tampilan

void main() {
  runApp(MyTaskApp());
}

class MyTaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateTaskScreen(), // Arahkan ke tampilan pembuatan tugas
    );
  }
}
