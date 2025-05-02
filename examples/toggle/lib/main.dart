import 'package:flutter/material.dart';
import 'package:toggle/toggle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      home: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Toggle(),
      ),
    );
  }
}
