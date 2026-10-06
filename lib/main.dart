import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const FreshSaveApp());
}

class FreshSaveApp extends StatelessWidget {
  const FreshSaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshSave',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7F6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A2948),
          primary: const Color(0xFF0A2948),
          secondary: const Color(0xFF4CAF50),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A2948),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}