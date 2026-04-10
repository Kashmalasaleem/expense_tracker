import 'package:flutter/material.dart';
import 'package:the_change/pages/home.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "olx app",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
