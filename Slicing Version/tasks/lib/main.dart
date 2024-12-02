import 'package:tasks/state_util.dart';
import 'package:tasks/core.dart';
import 'package:flutter/material.dart';
import 'package:tasks/pages/list_page.dart';
import 'package:tasks/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1F1F1F),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF2684FC),
          onPrimary: Color(0xFFF0F0F0), // Teks di atas warna primary
          secondary: Color(0xFF0066DA),
          onSecondary: Colors.red, // Teks di atas warna secondary
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFF141414), // Warna permukaan seperti card
          onSurface: Color(0xFFF0F0F0), // Warna teks pada permukaan
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          foregroundColor: Color(0xFFF0F0F0),
          elevation: 0,
        ),
        cardTheme: const CardTheme(
          color: Color(0xFF141414),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      home: const ListPage(),
    );
  }
}
