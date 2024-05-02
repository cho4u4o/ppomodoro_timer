import 'package:flutter/material.dart';
import 'package:ppomodoro_timer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xffe4e4e4),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF2b2b2b),
          ),
        ),
        cardColor: const Color(0xfff18fb6),
      ),
      home: const HomeScreen(),
    );
  }
}
