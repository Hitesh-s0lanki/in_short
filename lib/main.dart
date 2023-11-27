import 'package:flutter/material.dart';
import 'package:in_short/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'InShort Copy',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
