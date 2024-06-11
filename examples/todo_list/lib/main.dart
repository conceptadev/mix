import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:todo_list/pages/todo_list_page.dart';

import 'style/design_tokens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: lightTheme,
      child: const MaterialApp(
        home: TodoListPage(),
      ),
    );
  }
}
