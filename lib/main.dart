import 'package:flutter/material.dart';
import 'input_page.dart';
void main()=>runApp(const MyApp());
//TODO here the main function for the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IBM CALCULATOR',
      theme: ThemeData.dark().copyWith(
            primaryColor: const Color(0xFF0A0E21),
            scaffoldBackgroundColor: const Color(0xFF0A0E21),
            accentColor: Colors.purple
      ),
      home: const InputPage(),
    );
  }
}

