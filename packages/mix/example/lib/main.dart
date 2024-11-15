import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

final style = Style(
  $box.height(100),
  $box.width(100),
  $box.margin(10, 20),
  $box.color.blue(),
  $box.borderRadius(10),
  $box.padding(20, 10),
  $box.margin(10),
  $box.border(color: Colors.black, style: BorderStyle.solid, width: 1),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Box(
          style: style,
          child: const Center(child: Text('Hello Mix')),
        ),
      ),
    );
  }
}
